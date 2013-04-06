class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :authentication_token, null: false
      t.string    :ip
      t.timestamps
    end

    add_index :users, :authentication_token, unique: true
  end
end
