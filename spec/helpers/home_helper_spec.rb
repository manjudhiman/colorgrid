require 'rails_helper'

RSpec.describe HomeHelper, type: :helper do
  describe '#generate_tile' do
    subject { generate_tile(row, col) }
    let(:row) { 2 }
    let(:col) { 3 }

    context 'row and column are passed' do
      let(:result) { "<div onclick='toggleClass(this);' class='content'\n         id='tile-2_3' style='background-color: ' title=''></div>" }
      it 'returns the div' do
        expect(subject).to eq(result)
      end
    end
  end

  describe '#get_tile_details' do
    subject { get_tile_details(row, col) }
    let(:row) { 3 }
    let(:col) { 17 }
    let(:result) {
      [
        "#b36161",
        "User 10-1537680539 23-09-2018 14:37:57"
      ]
    }

    before do
      allow(Colorpalette).to receive(:find_color_code).with(row, col).and_return(result)
    end

    context 'row and col are passed' do
      it 'returns color and user details' do
        expect(subject).to eq(result)
      end
    end
  end

  describe '#style_attributes' do
    subject { style_attributes(tile_info) }
    let(:tile_info) { ["#1c8c4e", "Anonymous1-1537644228 22-09-2018 21:03:07"] }

    context 'when tile information is passed' do
      let(:attribute) { "style='background-color: #1c8c4e' title='Anonymous1-1537644228 22-09-2018 21:03:07'" }
      it 'returns style attributes' do
        expect(subject).to eq(attribute)
      end
    end
  end
end
