require 'rails_helper'

RSpec.describe Colorpalette, type: :model do
  describe 'User validations' do
    let(:user) { User.new(username: "abc", ipaddress: "0.0.0.0") }
    subject { described_class.new(user: user, code: "#FFFF" , row: 1, column: 3, user_id: '1', id: '1', created_at: '13212', updated_at: '13212') }

    context 'When username is not present' do
      it "should have many colorpalettes" do
        subject.row = nil
        expect(subject).to_not be_valid
      end
    end

    context 'When ipaddress is not present' do
      it "colorpalettes is not valid" do
        subject.column = nil
        expect(subject).to_not be_valid
      end
    end

    context 'When ipaddress is not present' do
      it "colorpalettes is not valid" do
        subject.code = nil
        expect(subject).to_not be_valid
      end
    end

    context 'When ipaddress is not present' do
      it "colorpalettes is not valid" do
        subject.user_id = nil
        expect(subject).to_not be_valid
      end
    end
  end
end