class CreateNamingProjects < ActiveRecord::Migration
  def change
    create_table :naming_projects do |t|
      t.string    :key, null: false
      t.text      :description
      t.string    :ip
      t.timestamps
    end
    add_index :naming_projects, :key, unique: true
  end
end
