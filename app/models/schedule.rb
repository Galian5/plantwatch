class Schedule < ApplicationRecord
  belongs_to :plant

  validates :watering, presence: true
  validates :interval, presence: true
end
