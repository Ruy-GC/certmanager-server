# require 'rails_helper'



# RSpec.describe ImportController, type: :controller do

#   describe '#upload' do
#     context 'when the file is successfully uploaded' do
#       let(:excel_file) { instance_double(Roo::Excelx) }
#       let(:params) { { file: 'example.xlsx' } }

#       before do
#         allow(Roo::Excelx).to receive(:new).and_return(excel_file)
#       end

#       it 'inserts the data into the database and renders a success response' do
#         instance = ImportController.new

#         # certifications_data = [
#         #   { title: 'Certification 1', category: 'Category 1', skills: 'Software', created_at: "2023-05-22 14:30:00", updated_at: "2023-05-22 14:30:00" },
#         #   { title: 'Certification 2', category: 'Category 2', skills: 'Software', created_at: "2023-05-22 14:30:00", updated_at: "2023-05-22 14:30:00" }
#         # ]

#         # allow(instance).to receive(:get_certifications_data).with(excel_file).and_return(certifications_data);
#         # allow(instance).to receive(:get_employees_data).and_return('Stubbed result')
#         # allow(instance).to receive(:get_cert_employees_data).and_return('Stubbed result')

#         employees_data = [
#           { id: 1, org: 'Organization 1', work_location: 'C' },
#           { id: 2, org: 'Organization 2', work_location: 'C' }
#         ]

#         cert_employees_data = [
#           { certification_id: 1, employee_id: 1 },
#           { certification_id: 2, employee_id: 2 }
#         ]

#         expect(excel_file).to receive(:cell).with(2, 'D').and_return('Certification 1')
#         expect(excel_file).to receive(:cell).with(2, 'F').and_return('Category 1')
#         expect(excel_file).to receive(:cell).with(3, 'D').and_return('Certification 2')
#         expect(excel_file).to receive(:cell).with(3, 'F').and_return('Category 2')

#         expect(excel_file).to receive(:cell).with(2, 'A').and_return(1)
#         expect(excel_file).to receive(:cell).with(2, 'B').and_return('Organization 1')
#         expect(excel_file).to receive(:cell).with(3, 'A').and_return(2)
#         expect(excel_file).to receive(:cell).with(3, 'B').and_return('Organization 2')
        
        
#         expect(excel_file).to receive(:cell).with(2, 'D').and_return('Certification 1')
#         expect(excel_file).to receive(:cell).with(2, 'A').and_return(1)
#         expect(excel_file).to receive(:cell).with(3, 'D').and_return('Certification 2')
#         expect(excel_file).to receive(:cell).with(3, 'A').and_return(2)
#         # expect(instance.get_certifications_data(excel_file)).to eq('Stubbed result')

#         expect(Certification).to receive(:find_or_initialize_by).with(title: 'Certification 1').and_return(instance_double(Certification, update!: true, id: 1))
#         expect(Certification).to receive(:find_or_initialize_by).with(title: 'Certification 2').and_return(instance_double(Certification, update!: true, id: 2))
#         expect(Employee).to receive(:find_or_initialize_by).with(id: 1).and_return(instance_double(Employee, update!: true))
#         expect(Employee).to receive(:find_or_initialize_by).with(id: 2).and_return(instance_double(Employee, update!: true))
#         expect(EmployeeCertification).to receive(:find_or_initialize_by).with(certification_id: 1).and_return(instance_double(EmployeeCertification, update!: true))
#         expect(EmployeeCertification).to receive(:find_or_initialize_by).with(certification_id: 2).and_return(instance_double(EmployeeCertification, update!: true))

#         post(:upload, params:)
#         expect(response).to have_http_status(:ok)
#         expect(response.body).to eq({
#           status: 'SUCCESS',
#           message: 'Uploaded Certifications Successfully!',
#           data: cert_employees_data
#         }.to_json
#         )
#       end
#     end

#     context 'when an error occurs during file upload' do

#       let(:params) { { file: 'example.xlsx' } }



#       before do

#         allow(Roo::Excelx).to receive(:new).and_raise(StandardError)

#       end



#       it 'renders a failed response' do

#         post(:upload, params:)



#         expect(response).to have_http_status(:error)

#         expect(response.body).to eq({

#           status: 'FAILED',

#           message: 'Error while uploading the certifications'

#         }.to_json

#                                    )

#       end

#     end

#   end

# end

