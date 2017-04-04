#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Define conserver:server::config::access
#
# This type defines access blocks in conserver.cf
#
#
#
# Parameters:
# - $title hostname or ipaddress or *
# - $trust array of trusted hostnames
#   renamed from reserved $trusted in puppet4
# - $limited array of group or user names
#            with limited console access
# - $rejected array of hostnames to reject

define conserver::config::access (
  $trust = [],
  $limited = [],
  $rejected = [],
  $order = '15'
){
  validate_array($trust)
  validate_array($limited)
  validate_array($rejected)
  if empty($trust) {
    $t_f = ''
  } else {
    $t_j = join($trust, ',')
    $t_f = "\n  trusted ${t_j};\n"
  }
  if empty($limited) {
    $l_f = ''
  } else {
    $l_j = join($limited, ',')
    $l_f = "  limited ${l_j};\n"
  }
  if empty($rejected) {
    $r_f = ''
  } else {
    $r_j = join($rejected, ',')
    $r_f = "  rejected ${r_j};\n"
  }

  concat::fragment { "ConserverAccessBlock ${title}":
    target  => 'ConserverConfigFile',
    content => "access ${title} {${t_f}${l_f}${r_f}}\n",
    order   => $order
  }
}
