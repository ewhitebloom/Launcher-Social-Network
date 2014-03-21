class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :interest_groups, through: :memberships

  def memberships(user_id)
    @joins = self.joins(:interest_groups)
    @joins.select(:name).where(':user_id = user_id')
  end
end
