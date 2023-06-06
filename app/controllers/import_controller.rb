class ImportController < ApplicationController
  def load
    render :load, status: :unprocessable_entity
  end

  def upload
    file = params[:file]

    begin
      excel_file = Roo::Excelx.new(file)

      # get the data for the certifications table
      cert_employees_data = []
      certifications_data = []
      employees_data = []

      (2..8788).each do |i|
        certifications_data << {
          title: excel_file.cell(i, 'D'),
          category: excel_file.cell(i, 'F'),
          skills: 'Software',
          created_at: Time.now.strftime('%Y-%m-%d %H:%M:%S'),
          updated_at: Time.now.strftime('%Y-%m-%d %H:%M:%S')
        }
        employees_data << {
          id: excel_file.cell(i, 'A'),
          org: excel_file.cell(i, 'B'),
          work_location: 'C',
          created_at: Time.now.strftime('%Y-%m-%d %H:%M:%S'),
          updated_at: Time.now.strftime('%Y-%m-%d %H:%M:%S')
        }
        cert_employees_data << {
          certification_id: excel_file.cell(i, 'D'),
          employee_id: excel_file.cell(i, 'A')
        }
      end
    rescue StandardError
      render json: { status: 'FAILED', message: 'Error while uploading the certifications' }
    end

    # insert the data into the database
    index = 0
    begin
      Certification.transaction do
        certifications_data.each do |cert_data|
          certification = Certification.find_or_initialize_by(title: cert_data[:title])
          certification.update!(cert_data)
          cert_employees_data[index][:certification_id] = certification.id
          index = index + 1 
        end
      end
      
      Employee.transaction do
        employees_data.each do |emp_data|
          employee = Employee.find_or_initialize_by(id: emp_data[:id])
          employee.update!(emp_data)
        end
      end

      EmployeeCertification.transaction do
        cert_employees_data.each do |cert_emp_data|
          employee_certification = EmployeeCertification.find_or_initialize_by(certification_id: cert_emp_data[:certification_id])
          employee_certification.update!(cert_emp_data)
        end
      end

      render json: { status: 'SUCCESS', message: 'Uploaded Certifications Successfully!', data: cert_employees_data }, status: :ok
    rescue ActiveRecord::RecordInvalid => e
      render json: { status: 'FAILED', message: "Error while uploading the certifications: #{e.message}" }, status: :error
    end
  end
end
