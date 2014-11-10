class Organization < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :problems
end
