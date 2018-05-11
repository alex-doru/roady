class HereMapsService


  def location_coordinates(location_name)

  end

  def route_link_ids(departure, destination)
    xml = HereMaps::RoutesRepo.new.calculateroute(departure, destination)
    route = HereMaps::Route.new(xml)
    ids = route.request_ready_link_ids

    HereMaps::TollsRepo.new.tolls(ids[2..-1])
  end

  def tolls(link_ids)

  end
end
