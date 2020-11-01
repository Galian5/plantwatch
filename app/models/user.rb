class User < ApplicationRecord
  has_many :devices, dependent: :destroy
end
