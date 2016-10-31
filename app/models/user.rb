class User < ApplicationRecord

  has_secure_password

  has_many :posts

  validates :username, :email_address, presence: true
end
