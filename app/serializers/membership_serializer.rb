class MembershipSerializer < ActiveModel::Serializer
  has_one :user
  has_one :group

  attributes :id, :user, :group
end
