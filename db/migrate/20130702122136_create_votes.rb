class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :turtle_id
      t.integer :user_id
      t.boolean :upvote
    end
  end
end
