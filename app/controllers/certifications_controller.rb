class CertificationsController < ApplicationController
    def create
        @certification = Certification.new(certification_params)
    if @certification.save
        render json: @certification, status: :created
    else
        render json: @certification.errors, status: :unprocessable_entity
    end

    private

    def certification_params
        params.require(:certification).permit(:name, :certified_by, :date, :user_id)
    end
end
