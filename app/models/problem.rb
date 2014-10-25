class Problem < ActiveRecord::Base
  belongs_to :organization

  validates :organization, presence: true
  validates :description, presence: true, length: { in: (15..200) }
end

