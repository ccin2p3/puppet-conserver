#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class conserver::server::service
#
# This class is meant to be called from conserver::server
# It ensures the service is running
#
class conserver::server::service {
  
  include conserver::server

  service { $conserver::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
