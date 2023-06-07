class EmployeeCertificationsController < ApplicationController
    before_action :find_certification, only: [:latest5, :amountPerMonth]
  
    def new
      @employee_certification = EmployeeCertification.new
    end
  
    def create
      @employee_certification = EmployeeCertification.new(employee_ertification_params)
      if @employee_certification.save
        render json: @employee_certification, status: :created
      else
        render json: @employee_certification.errors, status: :unprocessable_entity
      end
    end
  
    def latest5
      @certifications = EmployeeCertification.where(certification_id: params[:id])
                                            .select(:employee_id, :issued_date)
                                            .order('issued_date DESC')
                                            .first(5)
      render_certifications
    end
  
    def empCert
      @certifications = EmployeeCertification.select('employee_certifications.employee_id,employee_certifications.certification_id, certifications.title, employee_certifications.issued_date, employees.work_location, certifications.skills, certifications.category')
                                                     .joins(:certification, :employee)
      render_certifications
    end
  
    def amountPerMonth
      ranges = {
        '6 months' => (Date.today - 6.months)..Date.today,
        '12 months' => (Date.today - 12.months)..(Date.today - 6.months),
        '18 months' => (Date.today - 18.months)..(Date.today - 12.months),
        '24 months' => (Date.today - 24.months)..(Date.today - 18.months)
      }
  
      @counts = []
  
      ranges.each do |label, range|
        obj = {
          "name" => label,
          "amt" => EmployeeCertification.where(certification_id: params[:id], issued_date: range).count
        }
  
        @counts.push(obj)
      end
  
      render json: {
        status: 'SUCCESS',
        message: 'Issued certifications',
        data: @counts.reverse()
      }, status: :ok
    end
  
    private
  
    def employee_ertification_params
      params.require(:certification).permit(:employee_id, :certification_id, :issued_date)
    end
  
    def find_certification
      unless Certification.exists?(id: params[:id])
        render json: {
          status: 'FAILURE',
          message: 'That certification ID does not exist'
        }, status: :not_found
      end
    end
  
    def render_certifications
      if @certifications.present?
        render json: {
          status: 'SUCCESS',
          message: 'Certifications',
          data: @certifications
        }, status: :ok
      else
        render json: {
          status: 'FAILURE',
          message: 'No certifications found'
        }, status: :not_found
      end
    end
  end
  