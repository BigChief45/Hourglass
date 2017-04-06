require 'rails_helper'

RSpec.describe 'Records', type: :request do

  let(:punchcard) { FactoryGirl.create(:punchcard) }

  describe 'GET /punchcards/:id/records.json' do
    it 'returns punchcard records in JSON format' do
      FactoryGirl.create(:record, hours: 10, description: '10 hour practice', punchcard: punchcard)
      FactoryGirl.create(:record, hours: 5, description: '5 hour practice', punchcard: punchcard)

      get '/punchcards/1/records.json', headers: { 'Accept': 'application/vnd' }

      expect(response).to have_http_status 200

      body = JSON.parse(response.body)
      record_hours = body.map { |record| record[1] }

      expect(record_hours).to eq([10, 5])
    end
  end

end