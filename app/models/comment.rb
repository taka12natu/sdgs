class Comment < ApplicationRecord

	has_many :notifications, dependent: :destroy

	belongs_to :user
	belongs_to :post

	validates :content, presence: true, length: {maximum: 200}

	def self.search(word)
		if word
			where(['content LIKE ?', "#{word}%"])
		else
			all
		end
	end
end
