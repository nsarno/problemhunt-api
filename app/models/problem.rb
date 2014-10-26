class Problem < ActiveRecord::Base
  belongs_to :organization
  has_many :upvote

  validates :organization, presence: true
  validates :description, presence: true, length: { in: (5..200) }
end

