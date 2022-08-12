class Plant < ApplicationRecord
  has_one :schedule, dependent: :destroy
  has_one :setting, dependent: :destroy
  has_many :measurements, dependent: :destroy
  belongs_to :device
  belongs_to :user

  validates :name, presence: true, allow_blank: false
  validates :device_id, presence: true
  validates :user_id, presence: true

  def water_plant(watering_time)
    response = HTTParty.post("https://example.com?param1=value1", watering_time)
    response
  end
end
