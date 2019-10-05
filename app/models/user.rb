class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :courses, through: :posts
end
