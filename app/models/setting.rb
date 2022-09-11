class Setting < ApplicationRecord
  belongs_to :plant

  validates :single_watering_amount, numericality: true
  validates :min_air_humidity, numericality: true
  validates :max_air_humidity, numericality: true
  validates :min_soil_moisture, numericality: true
  validates :max_soil_moisture, numericality: true
  validates :min_temperature, numericality: true
  validates :max_temperature, numericality: true
  validates :max_insolation, numericality: true
  validates :min_water_amount, numericality: true
end
