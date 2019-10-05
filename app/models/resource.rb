class Resource < ApplicationRecord
  has_many :post_resources
  has_many :posts, through: :post_resources
end
