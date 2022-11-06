class Plant < ApplicationRecord
  has_one :schedule, dependent: :destroy
  has_one :setting, dependent: :destroy
  has_many :measurements, dependent: :destroy
  belongs_to :device
  belongs_to :user
  has_many_attached :photos

  validates :name, presence: true, allow_blank: false
  validates :device_id, presence: true
  validates :user_id, presence: true
  validate :photo_type

  private
  def photo_type
    photos.each do |photo|
      unless photo.content_type.in?(%('image/jpeg' image/png'))
        errors.add(:photos, 'needs to be a JPEG or PNG')
      end
    end
  end
end
