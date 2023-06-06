class RelatedController < ApplicationController
    require 'string/similarity'
    skip_before_action :authenticate_request
    
    def related3
        @certifications = Certification.all

        values = []

        @certification_name = Certification.where(id: params[:id]).select(:title)

        if @certification_name.exists?
            for i in @certifications
                if (i.title != @certification_name.first.title) 
                    similarity = String::Similarity.cosine i.title, @certification_name.first.title
                    values.push({ similarity: similarity, id: i.id, title: i.title })
                end
            end
        else
            render json: {
                status: 'FAILURE',
                message: 'That certification ID does not exist'
            }, status: :not_found
            return
        end

        sorted_values = values.sort_by { |value| value[:similarity] }.reverse
        highest_three_values = sorted_values.take(3)

        render json: {
            status: 'SUCCESS', 
            message: '3 Most similar certifications', 
            analyzed_title: @certification_name.first.title,
            data: highest_three_values
        }, status: :ok
    end
end
