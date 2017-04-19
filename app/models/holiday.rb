class Holiday < ApplicationRecord
  # mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :users
  belongs_to :group
end
