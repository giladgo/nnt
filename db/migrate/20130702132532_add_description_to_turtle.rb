class AddDescriptionToTurtle < ActiveRecord::Migration
  def change
    add_column :turtles, :description, :string
  end
end
