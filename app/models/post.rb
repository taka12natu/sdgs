class Post < ApplicationRecord

	has_many :comments
	has_many :post_tags
	has_many :tags, through: :post_tags
	accepts_nested_attributes_for :post_tags, allow_destroy: true

	belongs_to :user
	belongs_to :goal
end
