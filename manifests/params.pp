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
      $package_name = 'conserver'
      $service_name = 'conserver'
    }
    'RedHat', 'Amazon': {
      $package_name = 'conserver'
      $service_name = 'conserver'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
