require 'rails_helper'

describe HereMaps::Route do
  let(:response_xml) { File.read __dir__ + '/../../support/data/calculateroute.xml' }

  it 'initializes with a xml file' do
    expect(HereMaps::Route.new(response_xml)).to be_a(HereMaps::Route)
  end

  it 'gets the link ids as an array' do
    expect(HereMaps::Route.new(response_xml).link_ids).to eq([])
  end

end
