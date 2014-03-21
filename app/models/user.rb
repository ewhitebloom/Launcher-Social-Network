class User < ActiveRecord::Base
  belongs_to :interest_group
  has_many :posts
  has_many :comments
  has_many :memberships
  def self.memberships
    @joins = self.joins(users: [{posts: :comments}])
  end
end
