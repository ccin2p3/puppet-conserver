#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class: conserver::server
#
# This class manages the conserver master
#
# === Parameters
#
# [*package_name*]
#   Override ostomatic package_name
#
class conserver::server {
  include ::conserver
  $confdir      = $::conserver::confdir
  $masters      = $::conserver::masters

  $configfile = "${confdir}/conserver.cf"

  class { 'conserver::server::install': } ->
  class { 'conserver::server::config': } ~>
  class { 'conserver::server::service': } ->
  Class['conserver::server']
}
