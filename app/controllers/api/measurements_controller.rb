class MeassurementsController < ApplicationController
  before_action :set_meassurement, only: [:show, :create]

  # Create a new meassurement
  # POST /meassurements
  def create
    @meassurement = Meassurement.new(meassurement_params)
  end

  private

  def measurement_params
    params.require(:measurement).permit(:plant_id, :air_humidity, :soil_moisture, :temperature, :insolation, :water_amount)
  end
end