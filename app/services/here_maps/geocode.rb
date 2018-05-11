class HereMaps::Geocode

  def initialize(json)
    @json = json
  end

  def navigation_position
    location = @json.parsed_response["Response"]["View"][0]["Result"][0]["Location"]["NavigationPosition"].first
    "geo!#{location["Latitude"]},#{location["Longitude"]}"
  end
end
