class Form < ApplicationRecord
  belongs_to :project
  has_many :form_notify_emails, dependent: :destroy
end
