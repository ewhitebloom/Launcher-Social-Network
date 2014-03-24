class InterestGroup < ActiveRecord::Base
  has_many :posts
  has_many(:comments, through: :posts)
  has_many :users
  validates :name, presence: true
  validates :user, presence: true

  def posts_count
    posts.count
  end

  def popular_posts
    posts.comments.count
  end
end
