class Room < ActiveRecord::Base
  # Associations
  has_many :problems
  has_many :registrations
  has_many :users, through: :registrations

  # Validations
  validates :name, presence: true, uniqueness: true
end
