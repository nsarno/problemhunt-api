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

  it 'destroys the dependent registrations' do
    registration = create(:registration, user: user)
    user.destroy
    expect(Registration.find_by(id: registration.id)).to be(nil)
  end

  it 'destroys the dependent owned rooms' do
    room = create(:room, owner: user)
    user.destroy
    expect(Room.find_by(id: room.id)).to be(nil)
  end

  it 'destroys the dependent problems' do
    problem = create(:problem, user: user)
    user.destroy
    expect(Problem.find_by(id: problem.id)).to be(nil)
  end

  it 'destroys the dependent upvotes' do
    upvote = create(:upvote, user: user)
    user.destroy
    expect(Upvote.find_by(id: upvote.id)).to be(nil)
  end
end
