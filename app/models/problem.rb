class Problem < ActiveRecord::Base
  belongs_to :room
  has_many :upvotes

  validates :room, presence: true
  validates :description, presence: true, length: { in: (5..200) }
end
