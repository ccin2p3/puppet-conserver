#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Define conserver::config::default
#
# This type defines default blocks in conserver.cf
#
#
#
# Parameters:
# - $config hash describing default block

define conserver::config::default (
  $config,
  $order = '25'
){
  validate_hash($config)

  concat::fragment { "ConserverDefaultBlock ${title}":
    target  => 'ConserverConfigFile',
    content => template('conserver/server/default.erb'),
    order   => $order
  }
}
