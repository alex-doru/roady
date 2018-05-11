require 'rails_helper'

describe HereMaps::RoutesRepo do

  it 'calls the api' do
    xml = HereMaps::RoutesRepo.new.calculateroute('departure', 'destination')
    expect(xml).to be_a(String)
  end
end
