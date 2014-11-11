class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def upvotes problem
    problem.upvotes.create(user: self)
  end
end
