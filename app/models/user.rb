class User < ActiveRecord::Base
  cattr_accessor :current

  has_secure_password

  # Associations
  has_many :registrations
  has_many :rooms, through: :registrations
  has_many :owned_rooms, class_name: 'Room', foreign_key: :owner_id

  # Validations  
  validates :email, presence: true, uniqueness: true

  def upvotes problem
    problem.upvotes.create(user: self)
  end

  def registered? room
    self.rooms.include? room
  end
end
