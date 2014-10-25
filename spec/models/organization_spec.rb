require 'rails_helper'

RSpec.describe Organization, :type => :model do
  subject(:organization) { create :organization }

  it { is_expected.to be_valid }

  it 'validates presence of name' do
    expect(build :organization, name: nil).to be_invalid
  end
end
