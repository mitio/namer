class AddPublicCommentsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :public_comments, :boolean, null: false, default: false
  end
end
