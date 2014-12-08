require 'puppetlabs_spec_helper/module_spec_helper'

@common_facts = {
  :concat_basedir => '/DIR',
}

@os_facts = {
  'RedHat'            => @common_facts.merge({
    :operatingsystem      => 'RedHat',
    :osfamily             => 'RedHat',
    :server_package_name  => 'conserver',
    :client_package_name  => 'conserver-client',
  }),
  'Debian'            => @common_facts.merge({
    :operatingsystem     => 'Debian',
    :osfamily            => 'Debian',
    :server_package_name  => 'conserver-server',
    :client_package_name  => 'conserver-client',
  }),
}

