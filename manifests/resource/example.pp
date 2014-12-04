#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class conserver::resource::example
#
# This class is called from conserver::profile::*
# It creates an additional abstraction layer for composing resources
# into profiles. In the resource 'example' we use additional classes
# to separate configuration, package and services. You may not need to do this
# and put everything into example.pp, and drop example/* altogether
#
class conserver::resource::example (
  $package_name = $conserver::resource::example::params::package_name,
  $service_name = $conserver::resource::example::params::service_name,
) inherits conserver::resource::example::params {

  # validate parameters here

  class { 'conserver::resource::example::install': } ->
  class { 'conserver::resource::example::config': } ~>
  class { 'conserver::resource::example::service': } ->
  Class['conserver::resource::example']
}
