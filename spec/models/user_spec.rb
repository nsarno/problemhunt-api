require 'rails_helper'

RSpec.describe User, :type => :model do
  subject(:user) { create :user }

  it { is_expected.to be_valid }

  it 'validates presence of email' do
    expect(build :user, email: nil).to be_invalid
  end

  it 'validates presence of password' do
    expect(build :user, password: nil).to be_invalid
  end

  it 'validates uniqueness of email' do
    expect(build :user, email: subject.email).to be_invalid
  end
end
