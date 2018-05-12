class HereMaps::GeocoderRepo
  include HTTParty
  base_uri 'geocoder.cit.api.here.com'

  def initialize()
    @options = HereMaps::Config.sign(query: {})
  end

  def geocode(address)
    @options[:query][:searchText] = address
    json_response = self.class.get('/6.2/geocode.json', @options)

    HereMaps::Geocode.new(json_response)
  end
end
