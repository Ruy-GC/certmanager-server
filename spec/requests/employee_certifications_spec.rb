require 'rails_helper'

RSpec.describe "EmployeeCertifications", type: :request do
  before do
    allow_any_instance_of(EmployeeCertificationsController).to receive(:authenticate_request)
  end

  describe "GET /latest5" do
    let!(:certification) { FactoryBot.create(:certification) }

    context 'Valid Certification id' do
      it "Return data" do

        10.times do
          employee = FactoryBot.create(:employee)
          FactoryBot.create(:employee_certification, employee: employee, certification: certification)
        end

        get "/latest5/#{certification.id}"

        expect(response).to have_http_status(:ok)
        expect(response.body).to_not be_nil

      end
    end
    
  end
end
