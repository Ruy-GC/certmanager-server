class AddIdPk < ActiveRecord::Migration[7.0]
  def change
    execute "ALTER TABLE users DROP PRIMARY KEY"
    add_column :users, :id, :primary_key
  end
end
