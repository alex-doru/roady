class RouteCalculator
  attr_writer :coordinates, :tolls_data

  def initialize(start_location, end_location)
    @start_location = start_location
    @end_location = end_location
  end

  def total_cost

  end

  def tolls
    tolls_data
  end

  private

  def coordinates
    @coordinates ||= {
      start_coordinates: HereMaps::GeocoderRepo.new().geocode(@start_location).navigation_position,
      end_coordinates: HereMaps::GeocoderRepo.new().geocode(@end_location).navigation_position
    }
  end

  def tolls_data
    @tolls_data ||= JSON.parse(HereMapsService.new.route_link_ids(coordinates[:start_coordinates], coordinates[:end_coordinates]))
  end
end