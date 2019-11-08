class GroupSerializer < ActiveModel::Serializer
  belongs_to :creator # NEW => # belongs_to :users

  has_many :memberships # ORIGINAL => # has_many :attendees
  has_many :holidays
  has_many :users

  attributes :id, :name, :users, :holidays, :memberships
end
