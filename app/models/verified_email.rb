class VerifiedEmail < ApplicationRecord
  belongs_to :projects
  has_many :form_notify_emails, dependent: :destroy
end
