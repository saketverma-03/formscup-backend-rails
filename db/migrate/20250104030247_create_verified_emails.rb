class CreateVerifiedEmails < ActiveRecord::Migration[8.0]
  def change
    create_table :verified_emails do |t|
      t.string :email, null: false
      t.references :projects, null: false, foreign_key: true
      t.boolean :verified, default: false

      t.timestamps
    end
  end
end
