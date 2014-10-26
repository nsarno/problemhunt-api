class UpvoteSerializer < ActiveModel::Serializer
  attributes :id
  has_one :problem
  has_one :user
end
