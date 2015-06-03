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
      $service_name        = 'conserver'
      $masters             = [ 'localhost' ]
      $confdir             = '/etc/conserver'
      $restart_cmd         = "/usr/sbin/service ${service_name} restart"
    }
    'RedHat', 'Amazon': {
      $server_package_name = 'conserver'
      $client_package_name = 'conserver-client'
      $service_name        = 'conserver'
      $masters             = [ 'localhost' ]
      $confdir             = '/etc'
      $restart_cmd         = "/sbin/service ${service_name} restart"
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
  $reload_cmd = "service ${service_name} reload"
  $server_init_config_file = '/etc/default/conserver'
  $server_init_config_hash = {}
}
