class EmployeeCertification < ApplicationRecord
    has_one :employee
    has_one :certification
end