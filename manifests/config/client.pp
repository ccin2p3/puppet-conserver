#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Define conserver::config::client
#
# This type defines a client entry in console.cf
#
# Parameters:
# - $content (String/contents of $title) raw content
# - $order (String) fragment order
#

define conserver::config::client (
  $config,
  $order = '01'
){
  validate_hash($config)
  concat::fragment { "Console ${title}":
    target  => 'ConsoleConfigFile',
    content => template('conserver/client/config.erb'),
    order   => $order
  }
}
