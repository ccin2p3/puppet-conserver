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
  $template = undef,
  $config = {},
  $order = '01'
){
  validate_string($content)
  validate_string($template)
  validate_hash($config)
  if $template {
    $_content = template($template)
  } else {
    $_content = $content
  }
  concat::fragment { "ConserverCustom ${title}":
    target  => 'ConserverConfigFile',
    content => $_content,
    order   => $order
  }
}
