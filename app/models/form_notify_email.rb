class FormNotifyEmail < ApplicationRecord
  belongs_to :verified_emails
  belongs_to :forms
end
