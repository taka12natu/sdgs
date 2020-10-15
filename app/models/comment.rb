class Comment < ApplicationRecord

	has_many :notifications, dependent: :destroy

	belongs_to :user
	belongs_to :post

	def self.search(word)
		if word
			where(['content LIKE ?', "#{word}%"])
		else
			all
		end
	end
end
