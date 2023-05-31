class TypeToCategory < ActiveRecord::Migration[7.0]
  def change
    rename_column(:certifications,:type, :category)
  end
end
