require 'rails_helper'

describe Punchcard, type: :model do

  # Validate the factory
  it 'has a valid factory' do
    expect(build(:punchcard)).to be_valid
  end

end