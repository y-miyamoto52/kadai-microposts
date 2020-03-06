class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  
  has_many :reverce_of_favorite, class_name: 'Favorite', foreign_key: 'micropost_id'
  has_many :fans, through: :reverce_of_favorite, source: :user
  # has_many :fovorites
  # has_many :favorites, source: :user
end
