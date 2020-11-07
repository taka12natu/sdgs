class PostImage < ApplicationRecord
	has_many :image_tags, dependent: :destroy
	belongs_to :post
	attachment :image
end
