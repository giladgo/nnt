class Turtle < ActiveRecord::Base
  attr_accessible :description, :img_url, :name, :score, :user_id
end
