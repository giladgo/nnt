class RemoveImageUrlFromTurtle < ActiveRecord::Migration
  def change
    remove_column :turtles, :img_url
  end
end
