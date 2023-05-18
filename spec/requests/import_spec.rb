require 'rails_helper'

RSpec.describe "Imports", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/import/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/import/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/import/create"
      expect(response).to have_http_status(:success)
    end
  end

end
