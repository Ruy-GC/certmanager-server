class Certification < ApplicationRecord
    has_many :employee_certification

    validates :title, presence: true, uniqueness: true
    validates :category, presence: true
    validates :skills, presence: true
end
