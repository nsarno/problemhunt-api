class Upvote < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user

  validates :problem, presence: true
  validates :user, presence: true

  validates :user, uniqueness: { scope: :problem }
end
