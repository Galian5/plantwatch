class MeasurementsController < ApplicationController
  def index
    @plant = Plant.find(params[:plant_id])
    @measurements = plant.measurements.all
  end

  private
  def measurement_params
    params.require(:measurement).permit(:air_humidity, :soil_moisture, :temperature, :insolation, :water_amount)
  end
end
