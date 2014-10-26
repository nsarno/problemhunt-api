require 'rails_helper'

RSpec.describe Upvote, :type => :model do
  subject(:upvote) { create :upvote }

  it { is_expected.to be_valid }

  it 'validates presence of user' do
    expect(build :upvote, user: nil).to be_invalid
  end

  it 'validates presence of problem' do
    expect(build :upvote, problem: nil).to be_invalid
  end

  it 'validates uniqueness of one user upvote per problem' do
    user = create :user
    problem = create :problem
    create :upvote, problem: problem, user: user
    expect(build :upvote, problem: problem, user: user).to be_invalid
  end
end
