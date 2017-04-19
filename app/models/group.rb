class Group < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  has_and_belongs_to_many :attendees, class_name: "User", join_table: "groups_users"

  has_and_belongs_to_many :users
  has_many :holidays
end
