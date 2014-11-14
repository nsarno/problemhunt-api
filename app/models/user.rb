class User < ActiveRecord::Base
  has_secure_password

  # Associations
  has_many :registrations
  has_many :rooms, through: :registrations

  # Validations  
  validates :email, presence: true, uniqueness: true

  def upvotes problem
    problem.upvotes.create(user: self)
  end
end
