class Holiday < ApplicationRecord
  # mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :group

  has_many :users
  has_many :comments, dependent: :destroy

  # has_many :comments, dependent: :destroy
end
