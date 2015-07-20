require 'rails_helper'

describe 'routes for Api::V1::Messages' do
  let(:user_id) { Faker::Number.number(1) }
  it { expect(get('api/v1/#{user_id}/messages')).to route_to('api/v1/messages#index', user_id: user_id, format: :json) }
end