class CreateCertifications < ActiveRecord::Migration[7.0]
  def change
    create_table :certifications, id: false do |t|
      t.integer :certificationID, null: false, primary_key: true
      t.string :UID
      t.string :title
      t.string :type
      t.date :issue_date
      t.text :skills

      t.timestamps

    end

  end
end
