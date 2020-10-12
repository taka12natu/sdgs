class Post < ApplicationRecord

	has_many :comments
	has_many :post_tags
	has_many :favorites, dependent: :destroy
	has_many :tags, through: :post_tags
	accepts_nested_attributes_for :post_tags, allow_destroy: true

	belongs_to :user
	belongs_to :goal

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
