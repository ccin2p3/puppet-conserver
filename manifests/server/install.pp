#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class conserver::server::install
#
class conserver::server::install {
  
  include ::conserver::server

  package { $conserver::server::package_name:
    ensure => present,
  }
}
