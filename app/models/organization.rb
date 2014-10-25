class Organization < ActiveRecord::Base
  validates :name, presence: true

  before_create :downcase_name

  def downcase_name
    self.name = self.name.downcase
  end
end

