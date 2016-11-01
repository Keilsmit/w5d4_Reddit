class Tag < ApplicationRecord
  has_many :posts
  has_many :posts, through: :taggings
end
