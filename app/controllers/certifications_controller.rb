class CertificationsController < ApplicationController

    def index
        certifications = Certification.order('created_at DESC')
        render json: {status: 'SUCCESS', message: 'Loaded certifications', data:certifications}, status: :ok
    end

    def new
        @certification = Certification.new
    end

    def create
        @certification = Certification.new(certification_params)
        if @certification.save
            render json: @certification, status: :created
        else
            render json: @certification.errors, status: :unprocessable_entity
        end
    end

    private

    def certification_params
        params.require(:certification).permit(:title, :category, :skills)
    end
end