class ApiController < ApplicationController
  respond_to :json

  def coordinates
    string = params[:string]
    geocode = HereMaps::GeocoderRepo.new.geocode(string)
    @coordinates = geocode.simple_position
  end
end
