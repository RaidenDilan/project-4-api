class Holiday < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :group

  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates_presence_of :group_id, :user_id

  # private
  #   def message_time
  #     created_at.strftime("%d/%m/%y at %l:%M %p")
  #   end
end
