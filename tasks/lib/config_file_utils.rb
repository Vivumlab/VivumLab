# frozen_string_literal: true
# Contains logic surrounding vivumlab config files
module ConfigFileUtils

  # Class extends hashie::mash to silence warnings
  class ConfigFile < Hashie::Mash
    disable_warnings
  end

  def ansible_yml
    Psych.dump(decrypted_config_file.to_hash).gsub(': false', ': False').gsub(': true', ': True')
  end

  # these two methods load the config and vault files and convert them to
  # a special object type called Hashie#Mash. Mash objects extend the normal
  # hash (python dictionary) with dot notation access. This allows us to, for instance
  # call `config.sui.enable` and it will return the value for that field
  # if it exists. If that key doesn't exist, it will return nil. This is used
  # by last_good_key() (in utils.rb) to 'burn down' through the user provided
  # key and determine the most-specific key that matches.
  def vault_file
    @vault_file ||= ConfigFile.new(YAML.load_file("#{options[:config_dir]}/vault.yml"))
  end

  def decrypted_config_file
    return @decrypted_config_file unless @decrypted_config_file.nil?

    pass = File.read('/vlab_vault_pass')
    temp = YamlVault::Main.from_file(
      "#{options[:config_dir]}/encrypted.yml", [['*']],
      passphrase: pass
      ).decrypt_hash
    @decrypted_config_file ||= ConfigFile.new(temp)
  end

  def save_config_file
    say 'Saving config.yml'.blue
    to_encrypt = YamlVault::Main.from_content(ansible_yml, [['*']], passphrase: File.read('/vlab_vault_pass'))
    persist_current_config to_encrypt
  end

  def encrypt_temporary_decrypted_config(tmp_file = @temp_config)
    to_encrypt = YamlVault::Main.from_file(tmp_file, [['*']], passphrase: File.read('/vlab_vault_pass'))
    persist_current_config to_encrypt
  end

  def persist_current_config(to_encrypt)
    File.open("#{options[:config_dir]}/encrypted.yml", 'w') do |file|
      file.write(to_encrypt.encrypt_yaml)
    end
    say "#{options[:config_dir]}/encrypted.yml saved".green
  end

  # this writes a temporarially decrypted version of the config file to disk.
  # run playbook executes this just before invoking ansible, and no matter the
  # outcome of the playbook, it deletes this version.
  def write_temporary_decrypted_config
    @temp_config ||= "#{options[:config_dir]}/.#{SecureRandom.urlsafe_base64}.yml"
    File.open(@temp_config, 'w') do |file|
      file.write(ansible_yml)
    end
  end

  def last_good_key(hsh, key)
    while true
      key_bad = hsh.instance_eval(key) rescue nil
      break unless key_bad.nil?

      parts = key.split('.') # break that key up into an array of strings
      return nil if parts.size() == 1

      key = parts.take(parts.size() -1).join('.') # reset the key to be one section shorter. ie: sui.enabled -> sui
    end
    key # return the current, valid key.
  end

end
