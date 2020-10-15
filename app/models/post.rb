class Post < ApplicationRecord

	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :post_tags, dependent: :destroy
	has_many :tags, through: :post_tags
	accepts_nested_attributes_for :post_tags
	has_many :notifications, dependent: :destroy
	has_many :post_images, dependent: :destroy
	accepts_attachments_for :post_images, attachment: :image
	belongs_to :user
	belongs_to :goal

	default_scope -> { order(created_at: :desc) }

	def self.search(word)
		if word
			where(['title LIKE ?', "#{word}%"])
		else
			all
		end
	end

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
