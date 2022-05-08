class MeasurementsController < ApplicationController
  def show
    # chyba wrzuce je do widoku danej roslinki
  end

  def create
    @measurement = Measurement.new(measurement_params)
  end

  private
  def measurement_params
    params.require(:measurement).permit(:air_humidity, :soil_moisture, :temperature, :insolation, :water_amount)
  end
end
