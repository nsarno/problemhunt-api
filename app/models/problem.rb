class Problem < ActiveRecord::Base
  # Associations
  belongs_to :room
  belongs_to :user
  has_many :upvotes, dependent: :destroy

  # Validations
  validates :room, presence: true
  validates :description, presence: true, length: { in: (5..200) }
end
