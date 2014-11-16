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

  it 'has many rooms' do
    expect(user.rooms.count).to eq(0)
    user.rooms << create(:room)
    expect(user.rooms.count).to eq(1)
  end

  it 'has many owned rooms' do
    expect(user.owned_rooms.count).to eq(0)
    user.owned_rooms.create(attributes_for(:room))
    expect(user.owned_rooms.count).to eq(1)
  end
end
