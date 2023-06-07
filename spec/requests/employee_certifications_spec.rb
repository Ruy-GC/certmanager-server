require 'rails_helper'

RSpec.shared_examples "a certification endpoint" do |endpoint|
  let!(:certification) { FactoryBot.create(:certification) }

  context 'Valid Certification id' do
    it "returns data" do
      10.times do
        employee = FactoryBot.create(:employee)
        FactoryBot.create(:employee_certification, employee: employee, certification: certification)
      end

      get "/#{endpoint}/#{certification.id}"

      expect(response).to have_http_status(:ok)
      expect(response.body).to_not be_nil
    end
  end

  context 'invalid id' do
    it "gets invalid id" do
      get "/#{endpoint}/invalidID"
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(:not_found)
      expect(json_response['message']).to eq('That certification ID does not exist')
    end
  end
end

RSpec.describe "EmployeeCertifications", type: :request do
  before do
    allow_any_instance_of(EmployeeCertificationsController).to receive(:authenticate_request)
  end

  describe "GET /latest5" do
    it_behaves_like "a certification endpoint", "latest5"
  end

  describe "GET amountPerMonth" do
    it_behaves_like "a certification endpoint", "amntmonth"
  end

  describe "GET empcert" do
    let!(:certification) { FactoryBot.create(:certification) }

    it "returns data" do
      
      10.times do
        employee = FactoryBot.create(:employee)
        FactoryBot.create(:employee_certification, employee: employee, certification: certification)
      end

      get "/empCert"

      expect(response).to have_http_status(:ok)
      expect(response.body).to_not be_nil
    end
  end
end
