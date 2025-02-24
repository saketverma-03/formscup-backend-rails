class FormField < ApplicationRecord
  belongs_to :form
  enum field_type: { email: 0, text: 1, file: 2 }

  validates :field_type, presence: true
  validates :form_id, presence: true
end
