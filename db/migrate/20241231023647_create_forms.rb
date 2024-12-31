class CreateForms < ActiveRecord::Migration[8.0]
  def change
    create_table :forms do |t|
      t.string :name, null: false
      t.references :project, null: false, foreign_key: true
      t.json :fields
      t.string :auto_reply_to_field
      t.string :token
      t.string :dev_token

      t.timestamps
    end
  end
end
