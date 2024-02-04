require 'rails_helper'

RSpec.describe Api::V1::MentorsController, type: :controller do
  let!(:mentor) { create(:mentor) }

  describe 'GET #index' do
    before { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'JSON body response contains expected mentor attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response.first.keys).to match_array(%w[id name occupation about hourly_fee
                                                         year_of_experience location skills photo_url created_at updated_at])
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: mentor.id } }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'JSON body response contains expected mentor attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(%w[id name occupation about hourly_fee
                                                   year_of_experience location skills photo_url created_at updated_at])
    end

    it 'hourly_fee is a non-negative number' do
      json_response = JSON.parse(response.body)
      expect(json_response['hourly_fee'].to_f).to be >= 0
    end

    it 'year_of_experience is a non-negative integer' do
      json_response = JSON.parse(response.body)
      expect(json_response['year_of_experience']).to be_a(Integer)
      expect(json_response['year_of_experience']).to be >= 0
    end

    it 'photo_url is in a valid format' do
      json_response = JSON.parse(response.body)
      expect(json_response['photo_url']).to match(/\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/)
    end
  end
end
