class Certification < ApplicationRecord
    has_many :employee_certification

    validates :title, presence: true
    validates :category, presence: true
    validates :skills, presence: true
end
