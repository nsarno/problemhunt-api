class Registration < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :room

  # Validations
  validates :user, presence: true, uniqueness: { scope: :room }
  validates :room, presence: true, uniqueness: { scope: :user }
end
