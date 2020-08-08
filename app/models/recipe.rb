class Recipe < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :comments

  with_options presence: true do
    validates :title
    validates :time
    validates :body
    validates :image
  end
end

