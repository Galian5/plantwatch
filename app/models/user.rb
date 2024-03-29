class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :devices, dependent: :destroy
  has_many :plants, dependent: :destroy
  has_many :setting_sets, dependent: :destroy

  validates :name, presence: true
end
