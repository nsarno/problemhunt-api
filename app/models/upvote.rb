class Upvote < ActiveRecord::Base
  # Associations
  belongs_to :problem
  belongs_to :user

  # Validations
  validates :problem, presence: true
  validates :user, presence: true
  validates_uniqueness_of :user, scope: :problem
end
