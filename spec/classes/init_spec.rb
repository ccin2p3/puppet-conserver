require 'spec_helper'

os_fixtures = @os_fixtures

describe 'conserver' do
  context 'supported operating systems' do
    os_fixtures.each do |osname, osfixtures|
      describe "conserver class without any parameters on #{osname}" do
        let(:params) {{ }}
        let(:facts) {
          osfixtures[:facts]
        }

        it { should compile.with_all_deps }

        it { should contain_class('conserver::server') }
        it { should contain_class('conserver::server::install').that_comes_before('Class[conserver::server::config]') }
        it { should contain_class('conserver::server::config') }
        it { should contain_class('conserver::server::service').that_subscribes_to('Class[conserver::server::config]') }
        it { should contain_class('conserver::client') }
        it { should contain_class('conserver::client::install').that_comes_before('Class[conserver::client::config]') }

        it { should contain_service(osfixtures[:params][:server_service_name]) }
        it { should contain_package(osfixtures[:params][:server_package_name]).with_ensure('present') }
        it { should contain_package(osfixtures[:params][:client_package_name]).with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'conserver class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('conserver') }.to raise_error(Puppet::Error) }
    end
  end
end
