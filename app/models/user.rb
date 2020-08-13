class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :recipes, dependent: :destroy
  has_many :comments
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_recipes, through: :bookmarks, source: :recipe

  validates :username, presence: true
end
