class CreateEmployeeCertifications < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_certifications do |t|
      t.references :employee, null: false, foreign_key: true, type: :string
      t.references :certification, null: false, foreign_key: true
      t.date :issued_date
      t.timestamps
    end
  end
end