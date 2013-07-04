class Turtle < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :name, :score, :user, :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "/assets/:style/missing.png"
end
