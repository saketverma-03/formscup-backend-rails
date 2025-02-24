class DropFormData < ActiveRecord::Migration[8.0]
  def change
    drop_table :form_data
  end
end
