class AddIsPinnedToProjects < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :is_pinned, :boolean
  end
end
