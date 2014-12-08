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
class conserver::server (
  $package_name = $::conserver::server_package_name,
  $service_name = $::conserver::service_name,
  $confdir      = $::conserver::confdir,
  $masters      = $::conserver::masters,
) inherits conserver {
  
  $configfile = "${confdir}/conserver.cf"

  class { 'conserver::server::install': } ->
  class { 'conserver::server::config': } ~>
  class { 'conserver::server::service': } ->
  Class['conserver::server']
}
