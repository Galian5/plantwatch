class MeasurementsController < ApplicationController
  def show
    # chyba wrzuce je do widoku danej roslinki
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @measurement = plant.measurement.create(measurement_params)
    redirect_to plant_path(@plant)
  end

  private
  def measurement_params
    params.require(:measurement).permit(:air_humidity, :soil_moisture, :temperature, :insolation, :water_amount)
  end
end
