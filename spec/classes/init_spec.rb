require 'spec_helper'

os_facts = @os_facts

describe 'conserver' do
  context 'supported operating systems' do
    os_facts.each do |osname, osfacts|
      describe "conserver class without any parameters on #{osname}" do
        let(:params) {{ }}
        let(:facts) {
          osfacts
        }

        it { should compile.with_all_deps }

        it { should contain_class('conserver::params') }
        it { should contain_class('conserver::server') }
        it { should contain_class('conserver::server::install').that_comes_before('conserver::server::config') }
        it { should contain_class('conserver::server::config') }
        it { should contain_class('conserver::server::service').that_subscribes_to('conserver::server::config') }
        it { should contain_class('conserver::client') }
        it { should contain_class('conserver::client::install').that_comes_before('conserver::client::config') }

        it { should contain_service(facts[:server_service_name]) }
        it { should contain_package(facts[:server_package_name]).with_ensure('present') }
        it { should contain_package(facts[:client_package_name]).with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'conserver class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('conserver') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
