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
    @plant = Plant.find(measurement_params[:plant_id])
    send_notification if should_notify?
  end

  def send_notification
    NotificationMailer.with(user: @plant.user, plant: @plant, measurement: measurement_params).notification_mail.deliver_now
  end

  def should_notify?
    setting = @plant.setting
    return measurement_params[:air_humidity] if (measurement_params[:air_humidity] < setting.min_air_humidity || measurement_params[:air_humidity] > setting.max_air_humidity)
    return measurement_params[:soil_moisture] if (measurement_params[:soil_moisture] < setting.min_soil_moisture || measurement_params[:soil_moisture] > setting.max_soil_moisture)
    return measurement_params[:temperature] if (measurement_params[:temperature] < setting.min_temperature || measurement_params[:temperature] > setting.max_temperature)
    return measurement_params[:insolation] if measurement_params[:insolation] > setting.max_insolation
    return measurement_params[:water_amount] if measurement_params[:water_amount] < setting.min_water_amount
    false
  end

  private

  def measurement_params
    params.require(:measurement).permit(:plant_id, :air_humidity, :soil_moisture, :temperature, :insolation, :water_amount)
  end
end