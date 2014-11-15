class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :registered, :followers_count

  has_many :problems

  def registered
    User.current.registered? object
  end

  def followers_count
    object.users.count
  end
end
