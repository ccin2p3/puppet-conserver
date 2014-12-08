#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Define conserver::server::config::console
#
# This type defines console blocks in conserver.cf
#
#
#
# Parameters:
# - $config hash describing console block

define conserver::server::config::console (
  $config,
  $order = '45'
){
  validate_hash($config)
  unless has_key($config, 'master') {
    $master = $::conserver::masters[rrindex($::hostname,size($::conserver::masters))]
  }

  concat::fragment { "ConserverConsoleBlock ${title}":
    target  => 'ConserverConfigFile',
    content => template('conserver/server/console.erb'),
    order   => $order
  }
}
