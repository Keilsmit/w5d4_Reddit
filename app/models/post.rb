class Post < ApplicationRecord

  validates_presence_of :user
  belongs_to :user

  has_many :topicings
  has_many :topics, through: :topicings
  has_many :rejoiners

  has_many :tags
  has_many :tags, through: :taggings
end
