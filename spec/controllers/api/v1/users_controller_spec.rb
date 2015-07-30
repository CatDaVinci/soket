require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do
  let!(:user) { create(:user) }
  describe 'GET Show' do
    let(:show_request) { get :show, id: user.id }
    let(:show_response) { JSON.parse response.body }

    context 'responce' do
      before { show_request }
      it 'should have status 200' do
        expect(response).to have_http_status(200)
      end
      it 'should have user' do
        expect(show_response.count).to eq 1
      end
    end
  end
end
