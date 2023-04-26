class Employee < ApplicationRecord
    has_many :employee_certification
    
    validates :id, presence: true
end