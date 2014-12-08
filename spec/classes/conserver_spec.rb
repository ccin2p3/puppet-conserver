require 'spec_helper'

os_facts = @os_facts

describe 'conserver', :type => 'class' do
  os_facts.each do |osname, osfacts|
    let :facts do
      osfacts
    end
    context "On os `#{osname}`" do
      context "without overriding package name" do
        let(:params) {{ }}
        it { should contain_package(facts[:server_package_name]) }
        it { should contain_package(facts[:client_package_name]) }
      end
      context "with overriding package name" do
        let :params do {
            :server_package_name => 'foo',
            :client_package_name => 'bar',
        } end
        it { should_not contain_package(facts[:server_package_name]) }
        it { should_not contain_package(facts[:client_package_name]) }
        it { should contain_package('foo') }
        it { should contain_package('bar') }
      end
    end
  end
end
