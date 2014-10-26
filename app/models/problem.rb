class Problem < ActiveRecord::Base
  belongs_to :organization

  validates :organization, presence: true
  validates :description, presence: true, length: { in: (5..200) }
end

