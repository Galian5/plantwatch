class Device < ApplicationRecord
  has_many :plants, dependent: :delete_all
  belongs_to :user

  validates :name, presence: true
  validates :uri_address, presence: true
  validates :user_id, presence: true
end
