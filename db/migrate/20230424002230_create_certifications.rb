class CreateCertifications < ActiveRecord::Migration[7.0]
  def change
    create_table :certifications do |t|
      t.string :title
      t.string :type
      t.text :skills
      t.timestamps
    end
  end
end
