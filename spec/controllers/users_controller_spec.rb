require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'POST #create' do
    context 'when the request is valid' do
      let(:valid_attributes) { { user: { username: 'testuser' } } }

      before { post :create, params: valid_attributes }

      it 'creates a new user' do
        expect(User.count).to eq(1)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end

      it 'returns the user in the response body' do
        json_response = JSON.parse(response.body)
        expect(json_response['username']).to eq('testuser')
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { user: { username: '' } } }

      before { post :create, params: invalid_attributes }

      it 'does not create a new user' do
        expect(User.count).to eq(0)
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns a validation failure message' do
        json_response = JSON.parse(response.body)
        expect(json_response).to have_key('errors')
      end
    end
  end
end
