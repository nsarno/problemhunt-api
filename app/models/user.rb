class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true

  belongs_to :organization

  before_create :find_organization

  def find_organization
    domain_name = self.email.split('@').last.split('.').first.downcase
    organization = Organization.find_by_name(domain_name)
    organization = Organization.create(name: domain_name) if organization.nil?
    self.organization = organization
  end
end

