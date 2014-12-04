#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Define conserver::server::config::access
#
# This type defines access blocks in conserver.cf
#
#
#
# Parameters:
# - $title hostname or ipaddress or *
# - $trusted array of trusted hostnames
# - $limited array of group or user names
#            with limited console access
# - $rejected array of hostnames to reject

define conserver::server::config::access (
  $trusted = [],
  $limited = [],
  $rejected = [],
  $order = '15'
){
  validate_array($trusted)
  validate_array($limited)
  validate_array($rejected)
  unless empty($trusted) {
    $t_j = join($trusted, ',')
    $t_f = "\n  trusted ${t_j};\n"
  }
  unless empty($limited) {
    $l_j = join($limited, ',')
    $l_f = "  limited ${l_j};\n"
  }
  unless empty($rejected) {
    $r_j = join($rejected, ',')
    $r_f = "  rejected ${r_j};\n"
  }

  concat::fragment { "ConserverAccessBlock ${title}":
    target  => 'ConserverConfigFile',
    content => "access ${title} {${t_f}${l_f}${r_f}}\n",
    order   => $order
  }
}
