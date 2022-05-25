class Api::MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :create]

  # Create a new measurement
  api :POST, desc: 'api/measurements/create'
  param :measurement, Hash, required: true do
    param :plant_id, :number, required: true
    param :air_humidity, :number, required: true
    param :soil_moisture, :number, required: true
    param :temperature, :number, required: true
    param :insolation, :number, required: true
    param :water_amount, :number, required: true
  end

  formats %w[json]
  def create
    @measurement = measurement.new(measurement_params)
  end

  private

  def measurement_params
    params.require(:measurement).permit(:plant_id, :air_humidity, :soil_moisture, :temperature, :insolation, :water_amount)
  end
end