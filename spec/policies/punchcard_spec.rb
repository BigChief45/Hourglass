describe PunchcardPolicy do
  subject { described_class }

  let(:free_user) { FactoryBot.create(:user, email: 'test@msn.com', password: '12345678', password_confirmation: '12345678', premium: false) }

  let(:premium_user) { FactoryBot.create(:user, email: 'test2@msn.com', password: '12345678', password_confirmation: '12345678', premium: true) }

  permissions :create? do
    it 'only allows creating 1 punchcard for free users' do
      FactoryBot.create(:punchcard, name: 'Guitar', user: free_user)
      expect(subject).not_to permit(free_user, Punchcard.new(name: 'Reading'))
    end

    it 'allows Premium users to create unlimited punchcards' do
      FactoryBot.create(:punchcard, name: 'Bass', user: premium_user)
      expect(subject).to permit(premium_user, Punchcard.new(name: 'Drums'))
    end
  end
end
