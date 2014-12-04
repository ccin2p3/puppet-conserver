#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class conserver::resource::example::params
#
# This class is meant to be called from conserver::resource::example::config
# It sets variables according to platform
#
class conserver::resource::example::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'conserver'
      $service_name = 'conserver'
      $config_file = '/etc/conserver.conf'
      $config_include_dir = '/etc/conserver/conf.d'
      $init_defaults = '/etc/default/conserver'
    }
    'RedHat', 'Amazon': {
      $package_name = 'conserver'
      $service_name = 'conserver'
      $config_file = '/etc/conserver.conf'
      $config_include_dir = '/etc/conserver/conf.d'
      $init_defaults = '/etc/sysconfig/conserver'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
  $myparam = 'foo'
}

