#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class conserver::server::config
#
# This class is called from conserver::server
# It ensures the configuration files are generated
#
class conserver::server::config {
  
  include ::conserver::server
  
  concat { 'ConserverConfigFile':
    path           => $::conserver::server::configfile,
    warn           => true,
    ensure_newline => true,
    #    notify         => Exec['conserver_server_reload']
  }
}
