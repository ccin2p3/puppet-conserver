#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

#
class conserver (
  Boolean          $check_config_syntax,
  String[1]        $client_package_name,
  String[1]        $confdir,
  Boolean          $enable_client,
  Boolean          $enable_server,
  Boolean          $manage_init_defaults,
  Boolean          $manage_package,
  Array[String[1]] $masters,
  String[1]        $reload_cmd,
  String[1]        $restart_cmd,
  String[1]        $server_init_config_file,
  Hash             $server_init_config_hash,
  String[1]        $server_init_config_tpl,
  String[1]        $server_package_name,
  String[1]        $server_user,
  String[1]        $service_name,
  String[1]        $service_process,
  Boolean          $status_cmd,
  Boolean          $use_hiera,
) {

  # validate parameters here
  validate_absolute_path($confdir)
  validate_absolute_path($server_init_config_file)

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
