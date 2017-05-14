class Group < ApplicationRecord
  has_many :holidays, dependent: :destroy

  has_and_belongs_to_many :users, dependent: :destroy
  has_and_belongs_to_many :attendees, class_name: "User", join_table: "groups_users"

  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
end
