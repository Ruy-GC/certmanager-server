class ImportController < ApplicationController

  def get_certifications_data(excel_file)
    certifications_data = []
    (2..3).each do |i|
      certifications_data << {
        title: excel_file.cell(i, 'D'),
        category: excel_file.cell(i, 'F'),
        skills: 'Software',
        created_at: Time.now.strftime('%Y-%m-%d %H:%M:%S'),
        updated_at: Time.now.strftime('%Y-%m-%d %H:%M:%S')
      }
    end
    certifications_data
  end
  
  def get_employees_data(excel_file)
    employees_data = []
    (2..3).each do |i|
      employees_data << {
        id: excel_file.cell(i, 'A'),
        org: excel_file.cell(i, 'B'),
        work_location: 'C',
        created_at: Time.now.strftime('%Y-%m-%d %H:%M:%S'),
        updated_at: Time.now.strftime('%Y-%m-%d %H:%M:%S')
      }
    end
    employees_data
  end
  
  def get_cert_employees_data(excel_file)
    cert_employees_data = []
    (2..3).each do |i|
      cert_employees_data << {
        certification_id: excel_file.cell(i, 'D'),
        employee_id: excel_file.cell(i, 'A')
      }
    end
    cert_employees_data
  end

  def upload
    file = params[:file]

    begin
      excel_file = Roo::Excelx.new(file)

      # get the data for the certifications table
      cert_employees_data = []
      certifications_data = []
      employees_data = []

      certifications_data = get_certifications_data(excel_file)
      employees_data = get_employees_data(excel_file)
      cert_employees_data = get_cert_employees_data(excel_file)

      # puts certifications_data
      # puts employees_data


    rescue StandardError
      render json: { status: 'FAILED', message: 'Error while uploading the certifications' }
    end

    # insert the data into the database
    index = 0
    success = true

    begin
      Certification.transaction do
        certifications_data.each do |cert_data|
          certification = Certification.find_or_initialize_by(title: cert_data[:title])
          certification.update!(cert_data)
          cert_employees_data[index][:certification_id] = certification.id
          index += 1
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


    rescue ActiveRecord::RecordInvalid => e
      success = false
      render json: { status: 'FAILED', message: "Error while uploading the certifications: #{e.message}" }, status: :error
    end

    if success
      render json: { status: 'SUCCESS', message: 'Uploaded Certifications Successfully!', data: cert_employees_data }, status: :ok
    end
  end
end