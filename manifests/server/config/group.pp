#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Define conserver::server::config::group
#
# This type defines user groups in conserver.cf
#
#
#
# Parameters:
# - $users an array of members
#

define conserver::server::config::group (
  $users,
  $order = '05'
){
  validate_array($users)
  $users_j = join($users, ',')
  concat::fragment { "ConserverGroup ${title}":
    target  => 'ConserverConfigFile',
    content => "group ${title} {\n  users ${users_j};\n}",
    order   => $order
  }
}
