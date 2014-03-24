class InterestGroup < ActiveRecord::Base
  has_many :posts
  has_many(:comments, through: :posts)
  has_many :users
  validates :name, presence: true
  validates :user, presence: true

  def number_posts(group)
    @joined = group.joins(users: [{ posts: :comments }])
    @joined.select(:posts).count
  end

  def popular_posts(group)
    @joined = group.joins(users: [{ posts: :comments }])
    @joined.select(:posts).where('comments desc').limit(3)
  end
end
