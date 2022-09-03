class Api::MeasurementsController < ApplicationController
  respond_to :json
  skip_before_action :verify_authenticity_token

  # Create a new measurement
  api :POST, desc: 'api/measurements/create'
  param :measurement, Hash, required: true do
    param :plant_id, :number, required: true
    param :air_humidity, :number, required: false
    param :soil_moisture, :number, required: false
    param :temperature, :number, required: false
    param :insolation, :number, required: false
    param :water_amount, :number, required: false
  end

  formats %w[json]
  def create
    @measurement = Measurement.create(measurement_params)
  end

  private

  def measurement_params
    params.require(:measurement).permit(:plant_id, :air_humidity, :soil_moisture, :temperature, :insolation, :water_amount)
  end
end