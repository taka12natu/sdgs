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
  has_many :favorites, dependent: :destroy
  has_many :fav_posts, through: :favorites, source: :post

  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  # フォロワー表示機能は実装予定ないので、ここまで

  def self.search(word)
    if word
      where(['name LIKE ?', "#{word}%"])
    else
		  all
	  end
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

end
