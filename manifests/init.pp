#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class: conserver
#
# Full description of class conserver here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class conserver (
  $package_name = $conserver::params::package_name,
  $service_name = $conserver::params::service_name,
) inherits conserver::params {

  # validate parameters here

  class { 'conserver::install': } ->
  class { 'conserver::config': } ~>
  class { 'conserver::service': } ->
  Class['conserver']
}
