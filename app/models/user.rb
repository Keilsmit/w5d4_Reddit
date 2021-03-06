class User < ApplicationRecord

  has_secure_password

  has_many :posts

  validates :username, :email_address, presence: true

  validates :email_address,
            format: /\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\b/
end
