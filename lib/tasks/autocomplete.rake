require 'pp'

task :autocomplete => :environment do
  pp HereMaps::GeocoderAutocompleteRepo.new.geocode('Paris').suggested_city_names
end
