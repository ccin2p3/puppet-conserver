#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class conserver::server::config
#
# This class is called from conserver::server
# It ensures the configuration files are generated
#
class conserver::server::config {
  
  include ::conserver::server
  $init_config_file = $::conserver::server_init_config_file
  $init_config_hash = $::conserver::server_init_config_hash
  
  @concat { 'ConserverConfigFile':
    path           => $::conserver::server::configfile,
    warn           => true,
    ensure_newline => true,
  }
  if $::conserver::check_config_syntax {
    Concat <| title == 'ConserverConfigFile' |> {
      validate_cmd   => 'conserver -S -C %',
    }
  } else {
    Concat <| title == 'ConserverConfigFile' |>
  }
  if $::conserver::manage_init_defaults {
    include conserver::server::service::restart
    $merged_init_config_hash = merge($init_config_hash,$::conserver::params::server_init_config_hash)
    file {$init_config_file:
      ensure  => present,
      content => template($::conserver::params::server_init_config_tpl),
      notify  => Exec[conserver_restart]
    }
  }
}
