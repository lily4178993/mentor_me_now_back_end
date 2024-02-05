require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:mentor) { create(:mentor) }
  describe 'GET #index' do
    before do
      create_list(:reservation, 5, user_id: user.id, mentor_id: mentor.id)
      get :index
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns all reservations' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) do
      { reservation: { start_time: '10:00', end_time: '11:00', date: Date.today, user_id: user.id,
                       mentor_id: mentor.id } }
    end
    let(:invalid_attributes) { { reservation: { start_time: '', end_time: '', date: '', user_id: '', mentor_id: '' } } }

    context 'when the request is valid' do
      before { post :create, params: valid_attributes }

      it 'creates a reservation' do
        expect(response).to have_http_status(:created)
        expect(Time.parse(JSON.parse(response.body)['start_time']).strftime('%H:%M')).to eq('10:00')
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
