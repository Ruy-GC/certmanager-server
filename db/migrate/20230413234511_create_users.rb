# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      t.string :UID, null: false, primary_key: true
      t.string :email
      t.string :password
      t.string :org
      t.string :work_location

      t.timestamps
    end
  end
end
