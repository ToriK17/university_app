class PostResource < ApplicationRecord
  belongs_to :post 
  belongs_to :resource 
end
