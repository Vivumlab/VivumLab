#!/usr/bin/env bash

# Updates all services on the VivumLab server
Task::update() {
  : @desc "Updates all services on the VivumLab Server"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"

  Task::logo
  Task::build $(build_check) $(force_check)
  Task::git_sync
  Task::config

  highlight "Updating VivumLab Services"
  Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  -i inventory -t deploy playbook.vivumlab.yml || colorize light_red "error: update"
  Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  -i inventory playbook.restart.yml || colorize light_red "error: update: restart"
  highlight "Services Updated"
}

# Updates the specified service on the VivumLab server
Task::update_one(){
  : @desc "Updates the specified service on the VivumLab server"
  : @param service! "Service Name"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"

  Task::logo
  Task::build $(build_check) $(force_check)

  Task::git_sync
  Task::config

  Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory -t deploy playbook.vivumlab.yml || colorize light_red "error: update_one"
  Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory playbook.restart.yml || colorize light_red "error: update_one: restart"
  highlight "$_service Updated"
}
