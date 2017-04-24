class User < ApplicationRecord
  has_secure_password validations: false
  mount_uploader :image, ImageUploader

  has_many :holidays
  has_many :comments

  has_many :groups_created, class_name: "Group", foreign_key: "creator_id"
  has_and_belongs_to_many :groups_attending, class_name: "Group", join_table: "groups_users"

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, unless: :oauth_login?
  validates :password, presence: true, confirmation: true, unless: :oauth_login?, on: :create

  def oauth_login?
    github_id.present?
  end
end
