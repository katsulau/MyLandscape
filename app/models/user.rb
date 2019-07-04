class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  validates :name, presence: true

  has_many :posts
  has_many :comments
  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :post

  def already_liked?(post)
    self.favorites.exists?(post_id: post.id)
  end
end
