require 'rails_helper'

RSpec.describe 'Records', type: :request do

  let(:user) { FactoryGirl.create(:user, email: 'test@test.com', password: '12345678', password_confirmation: '12345678') }
  let(:punchcard) { FactoryGirl.create(:punchcard, id: 1, user: user) }

  before :each do
    sign_in user
  end

  describe 'GET /punchcards/:id/records.json' do
    it 'returns punchcard records in JSON format' do
      FactoryGirl.create(:record, hours: 10, description: '10 hour practice', punchcard: punchcard)
      FactoryGirl.create(:record, hours: 5, description: '5 hour practice', punchcard: punchcard)
      FactoryGirl.create(:record, hours: 5.5, description: '5 hour practice', punchcard: punchcard)

      get '/punchcards/1/records.json', headers: { 'Accept': 'application/vnd' }

      expect(response).to have_http_status 200

      record_hours = json_response.map { |record| record[1] }

      expect(record_hours).to eq([10, 5, 5.5])
    end
  end

end