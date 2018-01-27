FactoryBot.define do
  factory :punchcard do
    name 'Pool'
    description 'Billiards'
    user { create(:user) }
  end
end