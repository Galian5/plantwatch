class Plant < ApplicationRecord
  has_one :schedule, dependent: :destroy
  has_one :setting, dependent: :destroy
  has_one :measurement, dependent: :destroy
  belongs_to :device

  validates :name, presence: true, allow_blank: false

  def water_plant(watering_time)
    response = HTTParty.post("https://example.com?param1=value1", watering_time)
    response
  end
end