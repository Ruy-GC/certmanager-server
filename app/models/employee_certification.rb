class EmployeeCertification < ApplicationRecord
    belongs_to :employee
    belongs_to :certification
end