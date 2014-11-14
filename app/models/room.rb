class Room < ActiveRecord::Base
  # Validations
  validates :name, presence: true, uniqueness: true

  # Associations
  has_many :problems
  has_and_belongs_to_many :users
end
