#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class conserver::resource::example
#
# This class is meant to be called from conserver::resource::example
# It ensure the package is installed
#
class conserver::resource::example::install {

  package { $conserver::resource::example::params::package_name:
    ensure => present,
  }
}
