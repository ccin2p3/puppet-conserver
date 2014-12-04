#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class conserver::resource::example
#
# This class is called from conserver::resource::example
# It manages how the resource 'example' is configured
#
class conserver::resource::example::config (
  # params with default value from conserver::resource::example::params
  $myparam = $::conserver::resource::example::params::myparam,
  # other params
  $my_other_param = "bar"
)
{
  # insert configuration resources here
}
