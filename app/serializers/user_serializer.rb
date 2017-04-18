class UserSerializer < ActiveModel::Serializer
  has_many :holidays
  has_many :groups_created
  attributes :id, :username, :image, :full_name, :first_name, :last_name, :email, :password, :airport, :bio, :groups_created

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
