class Config < Thor
  require './tasks/utils.rb'
  include Utils
  namespace "config"
  require 'yaml'
  class_option :debug, :desc => "Debugs Ansible-playbook commands", :enum => ["none", "warn", "debug", "trace"], :default => :none
  class_option :config_dir, :type => :string, :desc => "Config dir to use", :default => "settings"

  desc "initial_config", "Creates or Updates the config file, as necessary"
  def initial_config()
    invoke "core:logo"
    say "Creating, or updating Config file #{options[:config_dir]}/config.yml".green
    run_playbook("playbook.config.yml", options)
    invoke "core:encrypt"
  end

  desc "show_config", "Shows the configuration settings for a specified service"
  option :service, required: true, :desc => "Name of the service to display", aliases: ['-s']
  def show_config
    config = YAML.load_file("#{options[:config_dir]}/config.yml")
    config_hash = config_file[options[:service]]
    table = TTY::Table.new(header: ["option", "value"], rows: config_hash)
    say table.render(:unicode)
  end

  desc "config_reset", "Resets Vlab config"
  def config_reset()
    invoke "core:logo"
    say "Resetting Config file #{options[:config_dir]}/config.yml".green
    say "Backing up your existing config"
    FileUtils.mv("#{options[:config_dir]}/", "settings-backup")
    invoke "config:initial_config"
  end

  desc "set", "Sets a config variable"
  option :config_key, :type => :string, :required => true, :desc => "Dot notation key to set"
  option :value, :type => :string, :required => true, :desc => "value to set"
  # This method contains some advanced, idiomatic ruby that may not be entirely
  # clear to new rubyists. I've tried to comment for clarity.
  def set()
    invoke "core:decrypt" # decrypt the vault
    # These two lines ensure the user-provided config_key exists, and identify
    # which file it's in. (config or vault).
    good_config_key = last_good_key(config_file, options[:config_key])
    good_vault_key = last_good_key(vault_file, options[:config_key])
    # if both good_*_key variables are nil, then the key provided doesn't match *at all* throw an error.
    if good_config_key.nil? && good_vault_key.nil?
      say "Key #{options[:config_key]} not found in either config file. Did you spell it right?".red
      # Following else if block only executes if the user supplied key is entirely valid and found in the config file
    elsif options[:config_key] == good_config_key
      eval "config_file.#{good_config_key.chomp}=#{options[:value]}"
      say "Saving config.yml"
      File.open("#{options[:config_dir]}/config.yml", 'w') do |file|
        # 'igt kids, circle round for a note on Ansible, Python and aribitrary decisions
        # made by developers that bite interoperability in the ass.
        #
        # The following line, and effectively identical one in the next else-if block
        # have to Dirty Dirty Hack around Ansible & Pythons fetish with Capitalized boolean values.
        # You see, YAML defines boolean as true, false and null, but for whatever reason, ansible
        # and I understand python, only understand True/False -- capitialized versions of the tried
        # and true / false. And I, for one, think that it's bullshit we have to globally search/replace
        # true and false in the config file whenever we write it because ansible/python doesn't understand
        # true and false.
        file.write(Psych.dump(config_file.to_hash).gsub(': false', ': False').gsub(': true', ': True'))
      end
      # Following else if block only executes if the user supplied key is entirely valid and found in the vault
    elsif options[:config_key] == good_vault_key
      eval "vault_file.#{good_vault_key.chomp}=#{options[:value]}"
      say "Saving Vault.yml"
      File.open("#{options[:config_dir]}/vault.yml", 'w') do |file|
        file.write(Psych.dump(vault.to_hash).gsub(': false', ': False').gsub(': true', ': True'))
      end
      # this else block runs only when the user provided key partially matches. For instance if they
      # gave us 'sui.enabled' instead of 'sui.enable' this block runs, and prints a table
      # of all the sui.* keys and their current values.
    else
      say "Unable to find a full match for the key #{options[:config_key]}".red
      say "Here's the most specific match found:".red
      table = TTY::Table.new(header: ["#{good_config_key}.<<option>>", "value"], rows: config_file[good_config_key])
      say table.render(:unicode)
    end
    # regardless of the change (or not), re-encrypt the vault
    invoke "core:encrypt"
  end

end
