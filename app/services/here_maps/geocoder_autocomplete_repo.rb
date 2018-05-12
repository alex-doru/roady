class HereMaps::GeocoderAutocompleteRepo
  include HTTParty
  base_uri 'autocomplete.geocoder.cit.api.here.com'

  def initialize()
    @options = HereMaps::Config.sign(query: {})
  end

  def geocode(address)
    @options[:query][:query] = address

    json_response = self.class.get('/6.2/suggest.json', @options)

    HereMaps::GeocodeSuggestion.new(json_response)
  end
end
