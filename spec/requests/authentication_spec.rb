require 'rails_helper'

RSpec.shared_examples "an invalid authentication" do |email, password|
  it 'returns an unauthorized status' do
    post :login, params: { email: email, password: password }

    json_response = JSON.parse(response.body)
    expect(response).to have_http_status(:unauthorized)
    expect(json_response['token']).to eq('Invalid username or password')
  end
end

RSpec.describe AuthenticationController, type: :controller do
  describe 'POST #login' do
    let!(:user) { FactoryBot.create(:user) }

    context 'with valid credentials' do
      it 'returns a JWT token' do
        post :login, params: { email: 'usertest@ibm.com', password: '123456' }

        json_response = JSON.parse(response.body)
        expect(response).to have_http_status(:ok)
        expect(json_response['token']).not_to be_nil
      end
    end

    context 'with invalid password' do
      it_behaves_like "an invalid authentication", 'usertest@ibm.com', 'invalidpassword'
    end

    context 'with invalid email' do
      it_behaves_like "an invalid authentication", 'invalidemail', '123456'
    end
  end
end