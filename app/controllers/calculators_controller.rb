class CalculatorsController < ApplicationController

  def new; end

  def create
    @calculator = RouteCalculator.new(params[:start_location], params[:end_location])
  end

end