require 'puppetlabs_spec_helper/module_spec_helper'

@common_facts = {
  :concat_basedir => '/DIR',
}

@os_facts = {
  'RedHat6'            => @common_facts.merge({
    :operatingsystem      => 'RedHat',
    :operatingsystemmajrelease => '6',
    :osfamily             => 'RedHat',
    :server_package_name  => 'conserver',
    :client_package_name  => 'conserver-client',
  }),
  'RedHat7'            => @common_facts.merge({
    :operatingsystem      => 'RedHat',
    :operatingsystemmajrelease => '7',
    :osfamily             => 'RedHat',
    :server_package_name  => 'conserver',
    :client_package_name  => 'conserver-client',
  }),
  'Debian7'            => @common_facts.merge({
    :operatingsystem     => 'Debian',
    :operatingsystemmajrelease => '7',
    :osfamily            => 'Debian',
    :server_package_name  => 'conserver-server',
    :client_package_name  => 'conserver-client',
  }),
  'Debian8'            => @common_facts.merge({
    :operatingsystem     => 'Debian',
    :operatingsystemmajrelease => '8',
    :osfamily            => 'Debian',
    :server_package_name  => 'conserver-server',
    :client_package_name  => 'conserver-client',
  }),
}

