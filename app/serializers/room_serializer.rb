class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :registered?, :registration_id, :followers_count, :owner?

  has_many :problems

private

  def registered?
    User.current.registered? object
  end

  def registration_id
    return 0 unless registered?
    User.current.registration_for(object).id
  end

  def owner?
    User.current.owner? object
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
