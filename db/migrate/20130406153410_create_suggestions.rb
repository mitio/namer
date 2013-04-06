class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string    :name, null: false
      t.integer   :naming_project_id, null: false
      t.string    :ip
      t.timestamps
    end

    add_index :suggestions, [:naming_project_id, :name], unique: true
  end
end
