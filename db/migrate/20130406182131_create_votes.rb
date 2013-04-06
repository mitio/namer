class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer   :suggestion_id, null: false
      t.integer   :user_id, null: false
      t.string    :vote, null: false
      t.timestamps
    end

    add_index :votes, [:user_id, :suggestion_id], unique: true
  end
end
