require 'rails_helper'

RSpec.describe Api::V1::MessagesController, :type => :controller do
  let!(:user) { create(:user) }

  describe 'GET Index' do
    let!(:messages) { create_list(:message, 5, user: user) }
    let(:index_request) { get :index, user_id: user.id }
    let(:index_response) { JSON.parse response.body }

    context 'responce' do
      before { index_request }
      it 'should have status 200' do
        expect(response).to have_http_status(200)
      end
      it 'should have massages' do
        expect(index_response['messages'].count).to eq 5
        index_response['messages'].each do |message|
          expect(message['user_id']).to eq user.id
        end
      end
    end
  end
end
