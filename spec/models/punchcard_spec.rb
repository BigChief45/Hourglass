require 'rails_helper'

describe Punchcard, type: :model do

  it 'has a valid factory' do
    expect(build(:punchcard)).to be_valid
  end

  context "validations" do
    it { is_expected.to validate_presence_of :name }
  end

end