require 'rails_helper'
require 'json'

RSpec.describe "Users", type: :request do
  describe 'GET index' do
    before do
      FactoryBot.create_list(:user, 10)
      get '/users'
    end
    
    it 'returns all users' do
      data = JSON.parse(response.body) 
      expect(data["data"].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end