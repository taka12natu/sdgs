class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :category, presence: true

  attachment :image

  has_many :posts
  has_many :comments

  def self.search(word)
	if word
		where(['name LIKE ?', "#{word}%"])
	else
		all
	end
  end

end
