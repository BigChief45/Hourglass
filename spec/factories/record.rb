FactoryGirl.define do
  factory :record do
    date Date.new
    hours 3
    description 'Description...'
    punchcard { create(:punchcard) }
  end
end