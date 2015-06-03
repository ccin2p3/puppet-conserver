#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Define conserver::config::break
#
# This type defines a break sequence in conserver.cf
#
# Parameters:
# - $users an array of members
#

define conserver::config::break (
  $string,
  $delay = 250,
  $order = '02'
){
  validate_re($title, ['^[0-9]$','^10$'])
  validate_string($string)
  concat::fragment { "ConserverBreakSequence ${title}":
    target  => 'ConserverConfigFile',
    content => "break ${title} { string '${string}'; delay ${delay}; }",
    order   => $order
  }
}
