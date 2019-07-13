class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :image, presence: true

  belongs_to :user
  has_many :comments
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :user
end
