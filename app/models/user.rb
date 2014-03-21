class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :memberships
  has_many(:interest_groups, through: :memberships)

  def memberships(user_id)
    user = User.where('id = user_id').first
    user.interest_groups
  end

  def number_of_posts(user_id)
    user = User.where('id = user_id').first
    user.posts.count
  end

  def number_of_comments(user_id)
    user = User.where('id = user_id').first
    user.comments.count
  end
end
