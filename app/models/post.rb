class Post < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_many :post_resources, dependent: :destroy
  has_many :resources, through: :post_resources

  def strftime_created_at
    created_at.strftime("%A, %b %-d %Y PST")
  end

  def strftime_updated_at
    updated_at.strftime("%A, %b %-d %Y PST")
  end

end
