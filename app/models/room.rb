class Room < ActiveRecord::Base
  # Associations
  has_many :problems
  has_many :registrations
  has_many :users, through: :registrations
  belongs_to :owner, class_name: 'User'

  # Validations
  validates :owner, presence: true
  validates :name, presence: true, uniqueness: true
end
