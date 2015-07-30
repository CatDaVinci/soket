require 'rails_helper'

describe 'routes for Api::V1::Users' do
  let(:id) { Faker::Number.number(1) }
  it { expect(get("api/v1/users/#{id}")).to route_to('api/v1/users#show', id:id, format: :json) }
end