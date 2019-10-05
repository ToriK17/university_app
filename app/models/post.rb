class Post < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_many :post_resources, dependent: :destroy
  has_many :resources, through: :post_resources
end
