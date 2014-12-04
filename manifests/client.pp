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
class conserver::client (
  $package_name = $::conserver::client_package_name,
  $confdir      = $::conserver::confdir,
) inherits conserver {

  class { 'conserver::client::install': } ->
  class { 'conserver::client::config': } ~>
  class { 'conserver::client::service': } ->
  Class['conserver::client']
}
