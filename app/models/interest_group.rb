class InterestGroup < ActiveRecord::Base
  has_many :posts
  has_many(:comments, through: :posts)
  has_many :users
  validates :name, presence: true
  validates :user, presence: true

  def number_posts(interestgroup_id)
    @joined = InterestGroup.joins(users: [{ posts: :comments }])
    @joined.select(:posts).where('interest_group_id = interestgroup_id').count
  end

  def popular_posts(interestgroup_id)
    @joined = InterestGroup.joins(users: [{ posts: :comments }])
    @joined.select(:posts).where('comments desc').where('interest_group_id = interestgroup_id').limit(3)
  end
end
