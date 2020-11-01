class Device < ApplicationRecord
  has_many :plants, dependent: :destroy
  belongs_to :user
end
