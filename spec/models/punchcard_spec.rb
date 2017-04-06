require 'rails_helper'

describe Punchcard, type: :model do

  # Validate the factory
  it 'has a valid factory' do
    expect(build(:punchcard)).to be_valid
  end

  context "validations" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_confirmation_of :password }
  end
end