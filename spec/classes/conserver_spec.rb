require 'spec_helper'

os_fixtures = @os_fixtures

describe 'conserver', type: 'class' do
  os_fixtures.each do |osname, osfixtures|
    context "On os `#{osname}`" do
      let :facts do
        osfixtures[:facts]
      end
      context 'without overriding package name' do
        let(:params) { {} }
        it { should contain_package(osfixtures[:params][:server_package_name]) }
        it { should contain_package(osfixtures[:params][:client_package_name]) }
      end
      context 'with overriding package name' do
        let :params do
          {
            server_package_name: 'foo',
            client_package_name: 'bar'
          }
        end
        it { should_not contain_package(osfixtures[:params][:server_package_name]) }
        it { should_not contain_package(osfixtures[:params][:client_package_name]) }
        it { should contain_package('foo') }
        it { should contain_package('bar') }
      end
    end
  end
end
