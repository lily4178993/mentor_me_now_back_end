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
      expect(json_response.first.keys)
        .to match_array(%w[id name occupation about hourly_fee
                           year_of_experience location skills photo_url remove created_at updated_at])
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: mentor.id } }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'JSON body response contains expected mentor attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(
        %w[id name occupation about hourly_fee year_of_experience
           location skills photo_url remove created_at updated_at]
      )
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

  describe 'POST #create' do
    let(:valid_attributes) do
      { mentor: { name: 'John Doe', occupation: 'Software Engineer', about: 'Experienced mentor', hourly_fee: 50.0,
                  year_of_experience: 5, location: 'New York', skills: 'Ruby, JavaScript',
                  photo_url: 'http://example.com/photo.jpg' } }
    end
    let(:invalid_attributes) do
      { mentor: { name: '', occupation: '', about: '', hourly_fee: -10, year_of_experience: -1,
                  location: '', skills: '',
                  photo_url: '' } }
    end

    context 'when the request is valid' do
      before { post :create, params: valid_attributes }

      it 'creates a mentor' do
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['name']).to eq('John Doe')
      end
    end

    context 'when the request is invalid' do
      before { post :create, params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/can't be blank/)
      end
    end
  end
end
