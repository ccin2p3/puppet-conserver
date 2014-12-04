#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class conserver::install
#
class conserver::install {

  package { $conserver::package_name:
    ensure => present,
  }
}
