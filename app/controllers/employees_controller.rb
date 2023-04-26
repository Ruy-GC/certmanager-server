class EmployeesController < ApplicationController
    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            render json: @employee, status: :created
        else
            render json: @employee.errors, status: :unprocessable_entity
        end
    end

    private

    def employee_params
        params.require(:employee).permit(:id, :org, :work_location)
    end
end
