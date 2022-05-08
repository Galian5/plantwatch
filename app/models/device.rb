class Device < ApplicationRecord
  has_many :plants, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true
end
