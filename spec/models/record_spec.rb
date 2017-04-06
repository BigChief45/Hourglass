require 'rails_helper'

describe Record, type: :model do

  it 'has a valid factory' do
    expect(build(:record)).to be_valid
  end

  context "validations" do
    it { is_expected.to validate_presence_of :hours }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_uniqueness_of :date }
  end
end