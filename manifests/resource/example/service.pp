#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class conserver::resource::example::service
#
# This class is meant to be called from conserver::resource::example
# It ensures the service is running
#
class conserver::resource::example::service {

  service { $conserver::resource::example::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
