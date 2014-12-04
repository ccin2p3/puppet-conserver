#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class conserver::client::install
#
class conserver::client::install {

  package { $conserver::client::package_name:
    ensure => present,
  }
}
