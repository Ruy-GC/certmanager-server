class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees, id: false  do |t|
      t.string :id, null: false, primary_key: true
      t.string :org
      t.string :work_location
      t.timestamps
    end
  end
end
