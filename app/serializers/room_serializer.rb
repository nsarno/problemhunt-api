class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :registered?, :followers_count, :owner?
  has_many :problems

private

  def registered?
    object.has_follower? scope
  end

  def owner?
    object.owner == scope
  end

  def followers_count
    object.users.length
  end
end
