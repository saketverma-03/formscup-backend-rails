class CreateFormSubmissions < ActiveRecord::Migration[8.0]
  def change
    create_table :form_submissions do |t|
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
