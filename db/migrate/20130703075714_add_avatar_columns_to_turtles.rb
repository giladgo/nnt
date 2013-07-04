class AddAvatarColumnsToTurtles < ActiveRecord::Migration
  def self.up
    add_attachment :turtles, :avatar
  end

  def self.down
    remove_attachment :turtles, :avatar
  end
end
