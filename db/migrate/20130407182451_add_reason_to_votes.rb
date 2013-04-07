class AddReasonToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :reason, :string
  end
end
