require 'pp'

task :geocode => :environment do
  depart_from =  HereMaps::GeocoderRepo.new().geocode('Timisoara').navigation_position
  arrive_at = HereMaps::GeocoderRepo.new().geocode('Budapesta').navigation_position
  cost = HereMapsService.new.route_link_ids(depart_from, arrive_at)
  pp "#{JSON.parse(cost)['costsByCountry'].reduce(0) { |sum, cost| sum += cost['amountInTargetCurrency'].to_f }} EUR"
end
