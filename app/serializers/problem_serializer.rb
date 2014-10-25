class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :description
  has_one :organization
end
