class User < ActiveRecord::Base
  has_secure_password

  # Associations
  has_many :registrations, dependent: :destroy
  has_many :rooms, through: :registrations
  has_many :owned_rooms, class_name: 'Room', foreign_key: :owner_id, dependent: :destroy
  has_many :problems, dependent: :destroy
  has_many :upvotes, dependent: :destroy

  # Validations  
  validates :email, presence: true, uniqueness: true

  def registered? room
    self.rooms.include? room
  end

  def owner? room
    self.owned_rooms.include? room
  end

  def follow room
    self.rooms << room
  end

  def unfollow room
    self.registrations.find_by!(room: room).destroy
  end

  def upvote problem
    self.upvotes.create(problem: problem)
  end

  def downvote problem
    self.upvotes.find_by!(problem: problem).destroy
  end
end
