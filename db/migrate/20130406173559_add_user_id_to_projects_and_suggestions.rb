class AddUserIdToProjectsAndSuggestions < ActiveRecord::Migration
  def change
    [:projects, :suggestions].each do |table|
      add_column table, :user_id, :integer
      add_index table, :user_id
    end
  end
end
