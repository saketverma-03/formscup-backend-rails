class AddDomainNameToProjects < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :domain_name, :string
  end
end
