require 'rails_helper'

RSpec.describe Room, :type => :model do
  subject(:room) { create :room }

  it { is_expected.to be_valid }

  it 'validates presence of name' do
    expect(build :room, name: nil).to be_invalid
  end

  it 'validates uniqueness of name' do
    expect(build :room, name: subject.name).to be_invalid
  end

  it 'has and belongs to many users' do
    user = create(:user)
    expect(room.users.count).to eq(0)
    room.users << user
    expect(room.users.count).to eq(1)
    # room.users << user
    # expect(room.users.count).to eq(1)
  end
end
