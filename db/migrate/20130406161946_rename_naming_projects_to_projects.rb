class RenameNamingProjectsToProjects < ActiveRecord::Migration
  def change
    rename_table :naming_projects, :projects
    rename_column :suggestions, :naming_project_id, :project_id
  end
end
