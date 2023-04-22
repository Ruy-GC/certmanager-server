class CreateUserCertifications < ActiveRecord::Migration[7.0]
  def change
    create_table :user_certifications, primary_key: [:UID, :certificationID] do |t|
      t.string :UID
      t.integer :certificationID

      t.timestamps
    end
  end
end
