require 'spec_helper'

describe 'conserver' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "conserver class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('conserver::params') }
        it { should contain_class('conserver::install').that_comes_before('conserver::config') }
        it { should contain_class('conserver::config') }
        it { should contain_class('conserver::service').that_subscribes_to('conserver::config') }

        it { should contain_service('conserver') }
        it { should contain_package('conserver').with_ensure('present') }
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
