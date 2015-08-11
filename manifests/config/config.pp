#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Define conserver::config::config
#
# This type defines config blocks in conserver.cf
#
#
#
# Parameters:
# - $config hash describing config block

define conserver::config::config (
  $config,
  $order = '25'
){
  validate_hash($config)

  concat::fragment { "ConserverDefaultBlock ${title}":
    target  => 'ConserverConfigFile',
    content => template('conserver/server/config.erb'),
    order   => $order
  }
}
