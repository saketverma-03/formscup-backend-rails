class CreateFormNotifyEmails < ActiveRecord::Migration[8.0]
  def change
    create_table :form_notify_emails do |t|
      t.references :verified_emails, null: false, foreign_key: true
      t.references :forms, null: false, foreign_key: true

      t.timestamps
    end
  end
end
