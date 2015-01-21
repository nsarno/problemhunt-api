class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :registered?, :registration_id, :followers_count, :owner?
  has_many :problems

private

  def registered?
    object.has_follower? scope
  end

  def registration_id
    return 0 unless registered?
    object.registration_for(scope).id
  end

  def owner?
    object.owner == scope
  end

  def followers_count
    object.users.length
  end
end
