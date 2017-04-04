#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class conserver::params
#
# This class is meant to be called from conserver
# It sets variables according to platform
#
class conserver::params {
  case $::osfamily {
    'Debian': {
      $server_package_name = 'conserver-server'
      $client_package_name = 'conserver-client'
      $service_name        = 'conserver-server'
      $masters             = [ 'localhost' ]
      $confdir             = '/etc/conserver'
      $restart_cmd         = "/usr/sbin/service ${service_name} restart"
      case $::operatingsystemmajrelease {
        '12.04': {
          $server_init_config_file = '/etc/conserver/server.local'
          $server_init_config_tpl = 'conserver/server/init_config_file.erb'
          $server_init_config_hash = {}
          $server_user = 'conservr'
          $status_cmd = false
        }
        '7': {
          $server_init_config_file = '/etc/conserver/server.local'
          $server_init_config_tpl = 'conserver/server/init_config_file.erb'
          $server_init_config_hash = {}
          $server_user = 'conservr'
          $status_cmd = true
        }
        '8','stretch/sid': {
          $server_init_config_file = '/usr/lib/systemd/system/conserver.service'
          $server_init_config_tpl = 'conserver/server/init_config_file_systemd.erb'
          $server_init_config_hash = {
            'Unit'          => {
              'Description' => 'Conserver Serial-Port Console Daemon',
              'After'       => 'network.target',
            },
            'Service' => {
              'Type' => 'forking',
              'ExecStart' => '/usr/sbin/conserver -d',
              'User' => 'root',
            },
            'Install' => {
              'WantedBy' => 'multi-user.target'
            }
          }
          $server_user = 'root'
          $status_cmd = true
        }
        default: {
          fail("operatingsystemmajrelease `${::operatingsystemmajrelease}` not supported")
        }
      }
    }
    'RedHat', 'Amazon': {
      $server_package_name = 'conserver'
      $client_package_name = 'conserver-client'
      $service_name        = 'conserver'
      $masters             = [ 'localhost' ]
      $confdir             = '/etc'
      $restart_cmd         = "/sbin/service ${service_name} restart"
      $status_cmd          = true
      $server_user         = 'root'
      case $::operatingsystemmajrelease {
        '6': {
          $server_init_config_file = '/etc/default/conserver'
          $server_init_config_tpl = 'conserver/server/init_config_file.erb'
          $server_init_config_hash = {}
        }
        '7': {
          $server_init_config_file = '/usr/lib/systemd/system/conserver.service'
          $server_init_config_tpl = 'conserver/server/init_config_file_systemd.erb'
          $server_init_config_hash = {
            'Unit'          => {
              'Description' => 'Conserver Serial-Port Console Daemon',
              'After'       => 'network.target',
            },
            'Service' => {
              'Type' => 'forking',
              'ExecStart' => '/usr/sbin/conserver -d',
              'User' => 'root',
            },
            'Install' => {
              'WantedBy' => 'multi-user.target'
            }
          }
        }
        default: {
          fail("operatingsystemmajrelease `${::operatingsystemmajrelease}` not supported")
        }
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
  $reload_cmd = "service ${service_name} reload"
  $service_process = 'conserver'
}
