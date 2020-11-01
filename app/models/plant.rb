class Plant < ApplicationRecord
  has_one :schedule, dependent: :destroy
  has_one :setting, dependent: :destroy
  has_one :measurement, dependent: :destroy
  belongs_to :device
end
