FactoryBot.define do
  factory :punchcard do
    name 'Pool'
    description 'Billiards'
    punchcard { create(:user) }
  end
end