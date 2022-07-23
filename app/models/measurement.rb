class Measurement < ApplicationRecord
  belongs_to :plant

  # returns Hash of floats with data from sensors
  # return {air_humidity: float, soil_moisture: float, temperature: float, insolation: float, water_amount: float}
  def get_measurements
    responce = HTTParty.get('http://192.168.0.106:8000/water', timeout: 10) # dac adres z raspa, ktory udostepnia dane
    responce
  end
end
