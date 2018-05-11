class HereMaps::Geocode

  def initialize(json)
    @json = json
  end

  def navigation_position
    "geo!#{simple_position}"
  end

  def simple_position
    "#{location["Latitude"]},#{location["Longitude"]}"
  end

  private

  def location
    @json.parsed_response["Response"]["View"][0]["Result"][0]["Location"]["NavigationPosition"].first
  end
end
