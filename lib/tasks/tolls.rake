task :get_tolls => :environment do
  puts HereMapsService.new.route_link_ids('geo!45.07031200000001,7.686856499999976', 'geo!48.85661400000001,2.3522219000000177')
end
