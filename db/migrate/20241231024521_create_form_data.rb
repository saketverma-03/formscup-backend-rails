class CreateFormData < ActiveRecord::Migration[8.0]
  def change
    create_table :form_data do |t|
      t.references :form, null: false, foreign_key: true
      t.json :data
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
