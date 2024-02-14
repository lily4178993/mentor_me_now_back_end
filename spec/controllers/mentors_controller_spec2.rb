require 'rails_helper'

RSpec.describe Api::V1::MentorsController, type: :controller do
  let!(:mentor) { create(:mentor) }

  describe 'DELETE #destroy' do
    let!(:mentor) { create(:mentor) }

    it 'deletes the mentor' do
      expect do
        delete :destroy, params: { id: mentor.id }
      end.to change(Mentor, :count).by(-1)
    end

    it 'returns status code 204' do
      delete :destroy, params: { id: mentor.id }
      expect(response).to have_http_status(:no_content)
    end
  end

  describe 'PATCH #remove_mentor' do
    before { patch :remove_mentor, params: { id: mentor.id } }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a success message' do
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('Mentor marked for removal')
    end
  end
end
