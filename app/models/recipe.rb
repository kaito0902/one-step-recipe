class Recipe < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :comments
  has_many :bookmarks, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :time
    validates :body
    validates :image
  end
  # recipeのお気に入り判定 → vies側で呼び出し
  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end

