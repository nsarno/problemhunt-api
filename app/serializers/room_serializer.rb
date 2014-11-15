class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :registered, :followers_count

  has_many :problems

  delegate :current_user, to: :scope

  def registered
    current_user.registered? object
  end

  def followers_count
    object.users.count
  end
end
