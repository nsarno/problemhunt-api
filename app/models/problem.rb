class Problem < ActiveRecord::Base
  belongs_to :organization
  has_many :upvotes

  validates :organization, presence: true
  validates :description, presence: true, length: { in: (5..200) }
end
