class User < ApplicationRecord
  has_secure_password validations: false
  # before_validation :downcase_email
  # before_validate :normalize_email

  has_many :groups, :through => :memberships # has many through memberships join table
  has_many :memberships, :dependent => :destroy # destroy the user in the members list if the user is deleted
  has_many :holidays, dependent: :destroy # has_many :groups, dependent: :nullify

  mount_uploader :image, ImageUploader

  # attr_accessible :email
  # #this gives you custom message for the error
  # validates :email => uniqueness => { :message => 'is a duplicate' }
  # #this is the callback

  validates :username, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, unless: :oauth_login?
  validates :password, presence: true, confirmation: true, unless: :oauth_login?, on: :create

  # def normalize_email
  #   self.email = self.email.downcase.strip
  # end
  #
  # # an even better way
  # def email=(email)
  #   super(email.downcase.strip)
  # end

  def oauth_login?
    github_id.present? || facebook_id.present?
  end

  # def downcase_email
  #   self.email = email.downcase
  # end

  # before_save do
  #   self.email.downcase! if self.email
  # end
  #
  # def self.find_for_authentication(conditions)
  #   conditions[:email].downcase!
  #   super(conditions)
  # end

  # private
  #   def time_format
  #     created_at.strftime("%d/%m/%y at %l:%M %p")
  #   end
end
