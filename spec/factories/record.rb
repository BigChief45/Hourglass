FactoryGirl.define do
  factory :record do
    date { Faker::Date.backward }
    hours 3
    description 'Description...'
    punchcard { create(:punchcard) }
  end
end