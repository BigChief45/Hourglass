require 'rails_helper'

describe Punchcard do

  # Validate the factory
  it 'has a valid factory' do
    expect(build(:punchcard)).to be_valid
  end

  it 'is invalid without a name' do
    expect(build(:punchcard, name: nil)).to_not be_valid
  end
end