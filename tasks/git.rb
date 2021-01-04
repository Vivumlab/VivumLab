# frozen_string_literal: true

# Class is reponsible for handling the git sync (optional) of the config directories
class Git < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  desc I18n.t('git.sync.usage'), I18n.t('git.sync.desc')
  option :disable_push, required: false, type: :boolean, desc: I18n.t('options.disablegitsync'), default: false
  def sync
    # @todo Check git:sync
    # @body 'reject_if_dir_not_present unless dir_exists' not working
    reject_if_dir_not_present unless Dir.exist? "settings/#{options[:config_dir]}/.git"

    say I18n.t('git.sync.out.settingssyncing').yellow
    execute_git_sync options[:config_dir], options[:disable_push]
    say I18n.t('git.sync.out.settingssynced').green
  end

  desc I18n.t('git.track.usage'), I18n.t('git.track.desc')
  option :branch, required: true, type: :string, desc: I18n.t('options.branchtrack')
  def track
    execute_in_shell("git checkout #{options[:branch]}")
    say I18n.t('git.track.out.trackbranch', branch: options[:branch]).green
  end

  no_commands do
    def reject_if_dir_not_present
      dir_exists = Dir.exist? "settings/#{options[:config_dir]}/.git"
      say I18n.t('git.sync.out.notsetup').red unless dir_exists
      exit 1 unless dir_exists
    end

    def ensure_precommit
      FileUtils.mkdir_p ".git/hooks"
      FileUtils.cp 'git_sync_pre_commit', ".git/hooks/pre-commit"
      FileUtils.chmod '+x', ".git/hooks/pre-commit"
    end

    def execute_git_sync(config_dir, disable_push)
      ensure_precommit
      execute_in_shell("git config --global user.email \"#{decrypted_config_file['admin_email']}\"")
      execute_in_shell("git config --global user.usage \"#{decrypted_config_file['default_username']}\"")
      (execute_in_shell('git pull', "settings/#{config_dir}") unless disable_push) rescue say 'Failed to pull, continuing.'.red
      execute_in_shell('git add .', "settings/#{config_dir}")
      execute_in_shell('git commit -a -m "updating settings"', "settings/#{config_dir}", true)
      execute_in_shell('git push', "settings/#{config_dir}") unless disable_push
    rescue Subprocess::NonZeroExit => e
      say 'Failed to execute some portion of the git sync.'.red
      say e
    end
  end
end
