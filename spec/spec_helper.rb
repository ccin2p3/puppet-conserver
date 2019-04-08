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

@common_fixtures = {
}

@os_fixtures = {
  'RedHat6' => @common_fixtures.merge(
    facts: {
      os: {
        family: 'RedHat',
        name: 'Scientific',
        release: { major: '6', full: '6.9', minor: '9' }
      }
    },
    params: {
      server_service_name: 'conserver',
      server_package_name: 'conserver',
      client_package_name: 'conserver-client'
    }
  ),
  'RedHat7' => @common_fixtures.merge(
    facts: {
      os: {
        family: 'RedHat',
        release: { major: 7 }
      }
    },
    params: {
      server_service_name: 'conserver',
      server_package_name: 'conserver',
      client_package_name: 'conserver-client'
    }
  ),
  'Debian7' => @common_fixtures.merge(
    facts: {
      os: {
        family: 'Debian',
        release: { major: 7 }
      }
    },
    params: {
      server_service_name: 'conserver-server',
      server_package_name: 'conserver-server',
      client_package_name: 'conserver-client'
    }
  ),
  'Debian8' => @common_fixtures.merge(
    facts: {
      os: {
        family: 'Debian',
        release: { major: 8 }
      }
    },
    params: {
      server_service_name: 'conserver-server',
      server_package_name: 'conserver-server',
      client_package_name: 'conserver-client'
    }
  ),
  'Debian9' => @common_fixtures.merge(
    facts: {
      os: {
        family: 'Debian',
        release: { major: 9 }
      }
    },
    params: {
      server_service_name: 'conserver-server',
      server_package_name: 'conserver-server',
      client_package_name: 'conserver-client'
    }
  ),
  'Ubuntu12.04' => @common_fixtures.merge(
    facts: {
      os: {
        family: 'Debian',
        release: { major: '12.04' }
      }
    },
    params: {
      server_service_name: 'conserver-server',
      server_package_name: 'conserver-server',
      client_package_name: 'conserver-client'
    }
  ),
  'Ubuntu14.04' => @common_fixtures.merge(
    facts: {
      os: {
        family: 'Debian',
        release: { major: '14.04' }
      }
    },
    params: {
      server_service_name: 'conserver-server',
      server_package_name: 'conserver-server',
      client_package_name: 'conserver-client'
    }
  ),
  'Ubuntu16.04' => @common_fixtures.merge(
    facts: {
      os: {
        family: 'Debian',
        release: { major: '16.04' }
      }
    },
    params: {
      server_service_name: 'conserver-server',
      server_package_name: 'conserver-server',
      client_package_name: 'conserver-client'
    }
  ),
  'Ubuntu18.04' => @common_fixtures.merge(
    facts: {
      os: {
        family: 'Debian',
        release: { major: '18.04' }
      }
    },
    params: {
      server_service_name: 'conserver-server',
      server_package_name: 'conserver-server',
      client_package_name: 'conserver-client'
    }
  )
}
