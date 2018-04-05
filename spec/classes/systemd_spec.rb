require 'spec_helper'

os_fixtures = @os_fixtures

describe 'conserver', type: 'class' do
  %w[RedHat7 Debian8 Debian9 Ubuntu16.04].each do |osname|
    osfixtures = os_fixtures[osname]

    context "On os `#{osname}`" do
      let :facts do
        osfixtures[:facts]
      end
      let(:params) { {} }
      it { should contain_systemd__unit_file("#{osfixtures[:params][:server_service_name]}.service") }
    end
  end
  ['RedHat6', 'Debian7', 'Ubuntu12.04'].each do |osname|
    osfixtures = os_fixtures[osname]

    context "On os `#{osname}`" do
      let :facts do
        osfixtures[:facts]
      end
      let(:params) { {} }
      it { should_not contain_systemd__unit_file("#{osfixtures[:params][:server_service_name]}.service") }
    end
  end
end
