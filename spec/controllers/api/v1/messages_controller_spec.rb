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

  describe 'POST Create' do
    let(:message_attr) { attributes_for(:message) }
    let(:create_request) { post :create, user_id: user.id, message: { body: message_attr[:body] } }
    let(:create_response) { JSON.parse response.body }

    context 'response' do
      before { create_request }

      it 'should have status 201' do
        expect(response.status).to eq(201)
      end

      it 'should have message' do
        expect(create_response['message']['body']).to eq message_attr[:body]
        expect(create_response['message']['user_id']).to eq message_attr[:user_id]
      end
    end

    context 'when message add' do
      it 'should have new message' do
        expect { create_request }.to change { Message.count }.by(1)
      end
    end
  end
end
