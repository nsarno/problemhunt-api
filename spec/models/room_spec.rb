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
end
