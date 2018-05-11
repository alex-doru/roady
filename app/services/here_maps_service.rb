class HereMapsService


  def location_coordinates(location_name)

  end

  def route_link_ids(departure, destination)
    xml = HereMaps::RoutesApi.get(departure, destination)
    route = HereMaps::Route.new(xml)
    route.link_ids
  end

  def tolls(link_ids)

  end
end
