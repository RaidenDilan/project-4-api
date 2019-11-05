class Group < ApplicationRecord
  # belongs_to :user
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  has_many :holidays, dependent: :destroy

  # has_many :attendees # OR ===> :users
  has_and_belongs_to_many :attendees, class_name: "User", join_table: "groups_users", dependent: :destroy
end

# If you set the :dependent option to:
#
# :destroy, when the object is destroyed, destroy will be called on its associated objects.
# :delete, when the object is destroyed, all its associated objects will be deleted directly from the database without calling their destroy method.
#
# You should not specify this option on a belongs_to association that is connected with a has_many association on the other class. Doing so can lead to orphaned records in your database.
