require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  context "validations" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_confirmation_of :password }
  end
end