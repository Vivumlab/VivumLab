module Utils
  class ConfigFile < Hashie::Mash
    disable_warnings
  end

  def current_version
    @current_version ||= File.read("VERSION").chomp
  end

  def latest_version
    @latest_version ||= HTTParty.get('https://raw.githubusercontent.com/Vivumlab/VivumLab/master/VERSION').chomp
  end

  def run_docker(params)
    execute_in_shell(params)
  end

  def run_playbook(playbook, options, extra="")
    say "#{options[:config_dir]}/config.yml".yellow
    # NOTE THIS IS NOT A DIRECT PORT OF THE BASH VERSION
    # THE BASH VERSION DOES SHELL EXPANSION, AND SHELL EXPANSION WITHIN " "'S
    # BREAKS RUBY'S EXECUTION OF THIS IN A SUB-PROCESS SHELL.
    # DO NOT, I REPEAT, DO NOT PUT THE QUOTES BACK IN
    playbook_command = <<-PLAYBOOK
    ansible-playbook #{playbook} #{convert_debug_enum(options[:debug].to_sym)} \
    -e \@./#{options[:config_dir]}/config.yml \
    -e \@./#{options[:config_dir]}/vault.yml \
    #{extra} \
    -i inventory
    PLAYBOOK
    run_docker(playbook_command.squeeze(" ").strip)
  end

  def execute_in_shell(params)
    Subprocess.call(params.split(' '))
  end

  def cat file
    Subprocess.call(['cat', file])
  end

  # these two methods load the config and vault files and convert them to
  # a special object type called Hashie#Mash. Mash objects extend the normal
  # hash (python dictionary) with dot notation access. This allows us to, for instance
  # call `config.sui.enable` and it will return the value for that field
  # if it exists. If that key doesn't exist, it will return nil. This is used
  # by last_good_key() (in utils.rb) to 'burn down' through the user provided
  # key and determine the most-specific key that matches.
  def config_file
    @config_file ||= ConfigFile.new(YAML.load_file("#{options[:config_dir]}/config.yml"))
  end

  def vault_file
    @vault_file |= ConfigFile.new(YAML.load_file("#{options[:config_dir]}/vault.yml"))
  end

  def convert_debug_enum(level)
    case level
    when :warn
      return '-v'
    when :debug
      return '-vv'
    when :trace
      return '-vvv'
    end
  end

  def hash_to_a(object)  # { 3 => 4 }
    return object unless object.is_a? Hash
      object.map do |k, v|
      [hash_to_a(k), hash_to_a(v)]
    end
  end

  def last_good_key(hsh, key)
    # binding.pry
    while true do
      key_bad = hsh.instance_eval(key) rescue nil
      if key_bad.nil?  # if the user specified key is bad
        parts = key.split('.') # break that key up into an array of strings
        return nil if parts.size() == 1
        key = parts.take(parts.size() -1).join('.') # reset the key to be one section shorter. ie: sui.enabled -> sui
        # restart the loop.
      else
        # the provided key (or shortened key) is valid
        break # stop the loop
      end
    end
    return key # return the current, valid key.
  end
end
