require 'rails_helper'

RSpec.describe Problem, :type => :model do
  subject(:problem) { create :problem }

  it { is_expected.to be_valid }

  it 'validates organization ref presence' do
    expect(build :problem, organization: nil).to be_invalid
  end

  it 'validates description presence' do
    expect(build :problem, description: nil).to be_invalid
  end

  it 'validates description length' do
    expect(build :problem, description: 'a' * 201).to be_invalid
    expect(build :problem, description: 'a' * 4).to be_invalid
  end
end
