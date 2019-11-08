class GroupSerializer < ActiveModel::Serializer
  belongs_to :creator

  has_many :memberships
  has_many :holidays
  has_many :users

  attributes :id, :name, :users, :holidays, :memberships
end
