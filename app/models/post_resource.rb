class PostResource < ApplicationRecord
  blongs_to :post 
  belongs_to :resource 
end
