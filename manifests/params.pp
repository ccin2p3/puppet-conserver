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
    }
    'RedHat', 'Amazon': {
      $server_package_name = 'conserver'
      $client_package_name = 'conserver-client'
      $service_name        = 'conserver'
      $masters             = [ 'localhost' ]
      $confdir             = '/etc'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
