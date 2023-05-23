class EmployeeCertificationsController < ApplicationController
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
            .select(:employee_id,:issued_date)
            .order('issued_date DESC')
            .first(5)
            
        render json: {
            status: 'SUCCESS', 
            message: '5 most recent certifications', 
            data: @certifications
            }, status: :ok

    end

    private

    def employee_ertification_params
        params.require(:certification).permit(:employee_id, :certification_id, :issued_date)
    end
end
