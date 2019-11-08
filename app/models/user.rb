class User < ApplicationRecord
  has_secure_password validations: false

  has_many :groups, :through => :memberships # has many through memberships join table
  has_many :memberships, :dependent => :destroy # destroy the user in the members list if the user is deleted
  has_many :holidays, dependent: :destroy # has_many :groups, dependent: :nullify

  mount_uploader :image, ImageUploader

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, unless: :oauth_login?
  validates :password, presence: true, confirmation: true, unless: :oauth_login?, on: :create

  def oauth_login?
    github_id.present? || facebook_id.present?
  end

  # private
  #   def time_format
  #     created_at.strftime("%d/%m/%y at %l:%M %p")
  #   end
end
