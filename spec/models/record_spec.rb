require 'rails_helper'

describe Record do

  it 'has a valid factory' do
    expect(build(:record)).to be_valid
  end

  it 'is invalid without an hour' do
    expect(build(:record, hours: nil)).to_not be_valid
  end

  it 'is invalid without a description' do
    expect(build(:record, description: nil)).to_not be_valid
  end

  it 'has a unique date' do
    old_record = build(:record, date: Date.new.yesterday)
    expect(build(:record).date).to_not eq(old_record.date)
  end
end