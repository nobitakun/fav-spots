class Info < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :url, presence: true, length: { maximum: 50 }
end
