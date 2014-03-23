class InterestGroup < ActiveRecord::Base
  has_many :posts
  has_many(:comments, through: :posts)
  has_many :users
  validates :name, presence: { message: "can't be blank" }
  validates :user, presence: { message: "can't be blank" }

  def self.number_posts
    @joined = self.joins(users: [{posts: :comments}])
    @joined.select(:posts).count
  end

  def self.popular_posts
    @joined = self.joins(users: [{posts: :comments}])
    @joined.select(:posts).where('comments desc').limit(3)
  end
end
