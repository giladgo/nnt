class SetDefaultValueToTurtleScore < ActiveRecord::Migration
  def up
    change_column :turtles, :score, :integer, :default => 1
  end

  def down
    change_column :turtles, :score, :integer, :default => nil
  end
end
