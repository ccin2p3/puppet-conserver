#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class: conserver
#
# Full description of class conserver here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class conserver (
  $server_package_name = $::conserver::params::server_package_name,
  $client_package_name = $::conserver::params::client_package_name,
  $service_name        = $::conserver::params::service_name,
  $service_process     = $::conserver::params::service_process,
  $confdir             = $::conserver::params::confdir,
  $masters             = $::conserver::params::masters,
  $reload_cmd          = $::conserver::params::reload_cmd,
  $restart_cmd         = $::conserver::params::restart_cmd,
  $status_cmd          = $::conserver::params::status_cmd,
  $enable_client       = true,
  $enable_server       = true,
  $manage_package      = true,
  $manage_init_defaults = true,
  $server_init_config_file = $::conserver::params::server_init_config_file,
  $server_init_config_hash = {},
  $server_user = $::conserver::params::server_user,
  $use_hiera = true,
  $check_config_syntax = true
) inherits conserver::params {

  # validate parameters here
  validate_string($server_package_name)
  validate_string($client_package_name)
  validate_string($service_name)
  validate_absolute_path($confdir)
  validate_array($masters)
  validate_string($reload_cmd)
  validate_string($restart_cmd)
  validate_bool($enable_client)
  validate_bool($enable_server)
  validate_bool($manage_init_defaults)
  validate_bool($manage_package)
  validate_bool($check_config_syntax)
  validate_absolute_path($server_init_config_file)
  validate_hash($server_init_config_hash)
  validate_string($server_user)

  if $enable_client {
    include ::conserver::client
  }
  if $enable_server {
    include ::conserver::server
    if $use_hiera {
      include ::conserver::config::hiera
    }
  }
}
