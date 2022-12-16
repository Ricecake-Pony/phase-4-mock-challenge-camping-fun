class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :difficulty
  has_many :signups
  has_many :campers
end
