class Spot < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :pref, presence: true
  validates :address, presence: true, length: { maximum: 50 }



  belongs_to :user
  
  has_many :reviews
  has_many :category_spots
  has_many :categories, through: :category_spots
  has_many :pictures, through: :reviews
  
  mount_uploader :image, ImageUploader
  
  geocoded_by :address
  after_validation :geocode
  
end
