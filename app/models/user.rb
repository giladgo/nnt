class User < ActiveRecord::Base
  has_many :turtles

  validates :name, presence: true, uniqueness: true
  attr_accessible :name, :password

end
