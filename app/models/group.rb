class Group < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id" # OR => belongs_to :user

  has_many :memberships, dependent: :destroy # destroy the relationship if group is deleted
  has_many :users, :through => :memberships # has many through members join table
  has_many :holidays, dependent: :destroy

  # has_and_belongs_to_many :attendees, class_name: "User", join_table: "groups_users", dependent: :destroy

  # validates_uniqueness_of :name
end
