class Problem < ActiveRecord::Base
  # Associations
  belongs_to :room
  belongs_to :user
  has_many :upvotes, dependent: :destroy

  # Validations
  validates :room, presence: true
  validates :description, presence: true, length: { in: (5..200) }

  def created_by? user
    self.user == user
  end

  def upvoted_by? user
    self.upvotes.select { |uv| uv.user == user }.any?
  end

  def upvote_for user
    self.upvotes.select { |uv| uv.user == user }.first
  end
end
