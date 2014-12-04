#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class conserver::profile::example
# 
# This class is a "profile" and should compose "resource" classes.
# It is called (composed) from "role" classes
#
class conserver::profile::example {
  include ::conserver::resource::example
}
