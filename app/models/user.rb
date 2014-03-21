class User < ActiveRecord::Base
  belongs_to :interest_group
  has_many :posts
  has_many :comments
  validates :interest_group_id, presence: true
end
