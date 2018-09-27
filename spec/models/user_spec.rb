require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User validations' do
    subject { described_class.new(username: "abc", ipaddress: "0.0.0.0") }

    context 'When username and ipaddress are present' do
       it "user is valid" do
         expect(subject).to be_valid
      end
    end

    context 'When username is not present' do
      it "user is invalid" do
        subject.username = nil
        expect(subject).to_not be_valid
      end
    end

    context 'When ipaddress is not present' do
      it "user is invalid" do
        subject.ipaddress = nil
        expect(subject).to_not be_valid
      end
    end
  end
end