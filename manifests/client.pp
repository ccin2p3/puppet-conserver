#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class: conserver::client
#
# This class manages the conserver client
#
# === Parameters
#
# [*package_name*]
#   Override ostomatic package_name
#
class conserver::client {
  include ::conserver
  $package_name = $::conserver::client_package_name
  $confdir      = $::conserver::confdir
  $configfile = "${confdir}/console.cf"

  class { 'conserver::client::install': }
  -> class { 'conserver::client::config': }
  -> Class['conserver::client']
}
