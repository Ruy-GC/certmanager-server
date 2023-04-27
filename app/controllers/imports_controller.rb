class ImportsController < ApplicationController
  before_action :set_import, only: %i[ show update destroy ]

  # GET /imports
  def index
    @imports = Import.all

    render json: @imports
  end

  # GET /imports/1
  def show
    render json: @import
  end

  # POST /imports
  def create
    @import = Import.new(import_params)

    if @import.save
      render json: @import, status: :created, location: @import
    else
      render json: @import.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /imports/1
  def update
    if @import.update(import_params)
      render json: @import
    else
      render json: @import.errors, status: :unprocessable_entity
    end
  end

  # DELETE /imports/1
  def destroy
    @import.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_import
      @import = Import.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def import_params
      params.fetch(:import, {})
    end
end
