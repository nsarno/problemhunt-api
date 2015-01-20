class Room < ActiveRecord::Base
  # Associations
  has_many :problems, dependent: :destroy
  has_many :registrations
  has_many :users, through: :registrations
  belongs_to :owner, class_name: 'User'

  # Validations
  validates :owner, presence: true
  validates :name, presence: true, uniqueness: true

  def has_follower? user
    self.users.include? user
  end

  def registration_for user
    self.registrations.select { |r| r.user_id == user.id }.first
  end

end
