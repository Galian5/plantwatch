class MeassurementsController < ApplicationController
  before_action :set_meassurement, only: [:show, :create]

  # Create a new meassurement
  api :POST, desc: 'meassurements/create'
  param :plant_id, String, required: true
  param :attachment, Hash, required: true, allow_nil: false do
    param :air_humidity, String, required: true
    param :soil_moisture, String, required: true
    param :temperature, String, required: true
    param :temperature, String, required: true
    param :insolation, String, required: true
    param :water_amount, String, required: true
  end
  formats %w[json]
  def create
    @meassurement = Meassurement.new(meassurement_params)
  end

  private

  def measurement_params
    params.require(:measurement).permit(:plant_id, :air_humidity, :soil_moisture, :temperature, :insolation, :water_amount)
  end
end