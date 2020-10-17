class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :affiliation, presence: true

  attachment :image

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fav_posts, through: :favorites, source: :post

#フォロー機能
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverce_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverce_relationships, source: :user


#通知機能
  has_many :active_notification, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notification, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

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

  def affiliation_display
    if affiliation == "individual"
      "個人"
    elsif affiliation == "company"
      "企業"
    elsif affiliation == "other"
      "その他"
    end
  end

end
