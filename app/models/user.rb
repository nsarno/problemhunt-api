class User < ActiveRecord::Base
  has_secure_password

  # Validations  
  validates :email, presence: true, uniqueness: true

  # Associations
  has_and_belongs_to_many :rooms

  def upvotes problem
    problem.upvotes.create(user: self)
  end
end
