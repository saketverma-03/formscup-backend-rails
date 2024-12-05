class Project < ApplicationRecord
  has_many :users, through: :project_users
end
