class HereMaps::GeocodeSuggestion


  def initialize(json)
    @json = json
  end

  def suggested_city_names
    only_city_suggestions.map() { |city_location| {city_name: city_location['address']['city'], country:  city_location['address']['country']}}
  end

  private

  def only_city_suggestions
    @json.parsed_response["suggestions"].select { |suggestion| suggestion['matchLevel'] == 'city' }
  end
end

# JSON Response example
# [{"label"=>"United States, NJ, Parsippany-Troy Hills Twp",
#   "language"=>"en",
#   "countryCode"=>"USA",
#   "locationId"=>"NT_tq6nlrAbvi-JxTztX0QxUC",
#   "address"=>
#     {"country"=>"United States",
#      "state"=>"NJ",
#      "county"=>"Morris",
#      "city"=>"Parsippany-Troy Hills Twp",
#      "postalCode"=>"07054"},
#   "matchLevel"=>"city"},
#  {"label"=>"United States, NJ, Parsippany",
#   "language"=>"en",
#   "countryCode"=>"USA",
#   "locationId"=>"NT_MY-Fpi7Vla7vhhlIV53wmC",
#   "address"=>
#     {"country"=>"United States",
#      "state"=>"NJ",
#      "county"=>"Morris",
#      "city"=>"Parsippany",
#      "postalCode"=>"07054"},
#   "matchLevel"=>"city"},
#  {"label"=>"India, Thane, Parsik Nagar Reti Bander Road",
#   "language"=>"en",
#   "countryCode"=>"IND",
#   "locationId"=>"NT_q3kHvLG-AOuCJFgoHueCNC",
#   "address"=>
#     {"country"=>"India",
#      "state"=>"MH",
#      "county"=>"Thane",
#      "city"=>"Thane",
#      "district"=>"Kalwa West",
#      "street"=>"Parsik Nagar Reti Bander Road",
#      "postalCode"=>"400605"},
#   "matchLevel"=>"street"},
#  {"label"=>"United Kingdom, NW6 1, London, Parsifal Road",
#   "language"=>"en",
#   "countryCode"=>"GBR",
#   "locationId"=>"NT_A-mFoKCrSc8krLu1BHFcDB",
#   "address"=>
#     {"country"=>"United Kingdom",
#      "state"=>"England",
#      "county"=>"London",
#      "city"=>"London",
#      "district"=>"Hampstead",
#      "street"=>"Parsifal Road",
#      "postalCode"=>"NW6 1"},
#   "matchLevel"=>"street"},
#  {"label"=>"India, Mumbai, Parsi Panchayat Road",
#   "language"=>"en",
#   "countryCode"=>"IND",
#   "locationId"=>"NT_7aJkfAH3f4iIyhN9Z1VzJD",
#   "address"=>
#     {"country"=>"India",
#      "state"=>"MH",
#      "county"=>"Mumbai Suburban",
#      "city"=>"Mumbai",
#      "district"=>"Andheri East",
#      "street"=>"Parsi Panchayat Road",
#      "postalCode"=>"400069"},
#   "matchLevel"=>"street"}]
