#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class conserver::client::config
#
# This class is called from conserver::client
# It ensures the configuration files are generated
#
class conserver::client::config {

  include ::conserver::client

  concat { 'ConsoleConfigFile':
    path           => $::conserver::client::configfile,
    warn           => true,
    ensure_newline => true,
    mode           => '0644',
  }
  concat::fragment { 'Console header':
    target  => 'ConsoleConfigFile',
    order   => '00',
    content => '# conserver/console configuration'
  }
}
