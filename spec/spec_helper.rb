require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet-facts'

begin
  require 'spec_helper_local' if File.file?(File.join(File.dirname(__FILE__),
                                                      'spec_helper_local.rb'))
rescue LoadError => loaderror
  warn "Could not require spec_helper_local: #{loaderror.message}"
end

include RspecPuppetFacts

default_facts = {
  puppetversion: Puppet.version,
  facterversion: Facter.version
}

default_facts_path = File.expand_path(File.join(File.dirname(__FILE__),
                                                'default_facts.yml'))
default_module_facts_path = File.expand_path(
  File.join(File.dirname(__FILE__),
            'default_module_facts.yml')
)

if File.exist?(default_facts_path) && File.readable?(default_facts_path)
  default_facts.merge!(YAML.safe_load(File.read(default_facts_path)))
end

if File.exist?(default_module_facts_path) &&
   File.readable?(default_module_facts_path)
  default_facts.merge!(YAML.safe_load(File.read(default_module_facts_path)))
end

RSpec.configure do |c|
  c.default_facts = default_facts
end

@common_facts = {
  concat_basedir: '/DIR'
}

@os_facts = {
  'RedHat6' => @common_facts.merge(operatingsystem: 'RedHat',
                                   operatingsystemmajrelease: '6',
                                   osfamily: 'RedHat',
                                   os: {
                                     family: 'RedHat',
                                     release: { major: 6 }
                                   },
                                   server_service_name: 'conserver',
                                   server_package_name: 'conserver',
                                   has_systemd: false,
                                   client_package_name: 'conserver-client'),
  'RedHat7' => @common_facts.merge(operatingsystem: 'RedHat',
                                   operatingsystemmajrelease: '7',
                                   osfamily: 'RedHat',
                                   os: {
                                     family: 'RedHat',
                                     release: { major: 7 }
                                   },
                                   has_systemd: false,
                                   server_service_name: 'conserver',
                                   server_package_name: 'conserver',
                                   client_package_name: 'conserver-client'),
  'Debian7' => @common_facts.merge(operatingsystem: 'Debian',
                                   operatingsystemmajrelease: '7',
                                   osfamily: 'Debian',
                                   has_systemd: false,
                                   os: {
                                     family: 'Debian',
                                     release: { major: 7 }
                                   },
                                   server_service_name: 'conserver-server',
                                   server_package_name: 'conserver-server',
                                   client_package_name: 'conserver-client'),
  'Debian8' => @common_facts.merge(operatingsystem: 'Debian',
                                   operatingsystemmajrelease: '8',
                                   osfamily: 'Debian',
                                   has_systemd: true,
                                   os: {
                                     family: 'Debian',
                                     release: { major: 8 }
                                   },
                                   server_service_name: 'conserver-server',
                                   server_package_name: 'conserver-server',
                                   client_package_name: 'conserver-client'),
  'Debian9' => @common_facts.merge(operatingsystem: 'Debian',
                                   operatingsystemmajrelease: '9',
                                   osfamily: 'Debian',
                                   has_systemd: true,
                                   os: {
                                     family: 'Debian',
                                     release: { major: 9 }
                                   },
                                   server_service_name: 'conserver-server',
                                   server_package_name: 'conserver-server',
                                   client_package_name: 'conserver-client'),
  'Ubuntu12.04' => @common_facts.merge(operatingsystem: 'Ubuntu',
                                       operatingsystemmajrelease: '12.04',
                                       osfamily: 'Debian',
                                       has_systemd: true,
                                       os: {
                                         family: 'Debian',
                                         release: { major: 8 }
                                       },
                                       server_service_name: 'conserver-server',
                                       server_package_name: 'conserver-server',
                                       client_package_name: 'conserver-client')
}
