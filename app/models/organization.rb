class Organization < ActiveRecord::Base
  validates :name, presence: true
  has_many :problems
end
