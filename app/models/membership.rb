class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :user_id, :presence => true
  validates :group_id, :presence => true
  # avoid in memory duplicates. You will also need add unique index to db
  validates :user_id, :uniqueness => {:scope => [:user_id, :group_id]}	
end
