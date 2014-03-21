class Post < ActiveRecord::Base
  belongs_to :interest_group
  belongs_to :user
  has_many :comments
end
