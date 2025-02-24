class RemoveFieldsFromForm < ActiveRecord::Migration[8.0]
  def change
    remove_column :forms, :fields, :json
  end
end
