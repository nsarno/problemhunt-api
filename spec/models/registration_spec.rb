require 'rails_helper'

RSpec.describe Registration, :type => :model do
  subject(:registration) { create :registration }

  it { is_expected.to be_valid }

  it 'validates presence of user' do
    expect(build :registration, user: nil).to be_invalid
  end

  it 'validates presence of room' do
    expect(build :registration, room: nil).to be_invalid
  end

  it 'validates uniqueness of one user registration per room' do
    user = create :user
    room = create :room
    create :registration, user: user, room: room
    expect(build :registration, user: user, room: room).to be_invalid
  end
end
