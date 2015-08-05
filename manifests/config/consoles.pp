#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Define conserver::config::consoles
#
# This type defines multiple console blocks in conserver.cf
#
# Parameters:
# - $hash_data hash describing consoles block

define conserver::config::consoles (
  $hash_data,
  $order = '50'
){
  include ::conserver
  $masters = $::conserver::masters
  validate_hash($hash_data)

  concat::fragment { "ConserverMultiConsoleBlock ${title}":
    target  => 'ConserverConfigFile',
    content => template('conserver/server/consoles.erb'),
    order   => $order
  }
}
