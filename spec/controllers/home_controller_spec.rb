require 'rails_helper'

RSpec.describe Colorgrid::HomeController, type: :controller do

  let(:user) {
    double(id: 10, username: "User 10-1537680539", ipaddress: "127.0.0.1", created_at: "2018-09-23 05:28:59", updated_at: "2018-09-23 05:28:59")
  }

  describe '#set_username' do
    before do
      allow(controller).to receive(:set_username).and_return(user)
    end

    subject { controller.send :set_username }
    context 'when the user is present' do
      it 'returns true' do
        expect(subject).to be(user)
      end
    end
  end
end