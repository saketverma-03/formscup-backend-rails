class FormData < ApplicationRecord
  belongs_to :form
  enum status: { pending: 0, clean: 1, spam: 2 }
end
