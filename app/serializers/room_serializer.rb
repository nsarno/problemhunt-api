class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :registered?, :registration_id, :followers_count, :owner?
  has_many :problems

private

  def registered?
    object.has_follower? User.current
  end

  def registration_id
    return 0 unless registered?
    object.registration_for(User.current).id
  end

  def owner?
    object.owner == User.current
  end

  def followers_count
    object.users.length
  end
end
