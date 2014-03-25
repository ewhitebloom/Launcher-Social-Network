class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :interest_group
  validates :user_id, presence: true
  validates :interest_group_id, presence: true
end
