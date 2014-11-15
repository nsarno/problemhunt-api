class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :registered?, :followers_count

  has_many :problems

private

  def registered?
    User.current.registered? object
  end

  def followers_count
    object.users.count
  end

  def attributes
    data = super
    data[:registration_id] = object.registrations.where(user: User.current).first.id if registered?
    data
  end
end
