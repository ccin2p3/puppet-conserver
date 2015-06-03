#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Define conserver::config::custom
#
# This type defines a custom entry in conserver.cf
#
# Parameters:
# - $content (String/contents of $title) raw content
# - $order (String) fragment order
#

define conserver::config::custom (
  $content = $title,
  $order = '01'
){
  validate_string($content)
  concat::fragment { "ConserverCustom ${title}":
    target  => 'ConserverConfigFile',
    content => $content,
    order   => $order
  }
}
