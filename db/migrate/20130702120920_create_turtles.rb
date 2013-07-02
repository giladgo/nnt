class CreateTurtles < ActiveRecord::Migration
  def change
    create_table :turtles do |t|
      t.string :name
      t.integer :score
      t.string :img_url
      t.integer :user_id
      t.timestamps
    end
  end
end
