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
  $server_package_name = $::conserver::params::server_package_name,
  $client_package_name = $::conserver::params::client_package_name,
  $service_name        = $::conserver::params::service_name,
  $confdir             = $::conserver::params::confdir,
  $masters             = $::conserver::params::masters,
  $enable_client       = true,
  $enable_server       = true,
) inherits conserver::params {

  # validate parameters here
  
  if $enable_client {
    include ::conserver::client
  }
  if $enable_server {
    include ::conserver::server
  }
}
