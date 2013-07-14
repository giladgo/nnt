class User < ActiveRecord::Base
  has_many :votes
  has_many :uploaded_turtles, :source => :turtle, :class_name => :Turtle, :foreign_key => :user_id
  has_many :voted_turtles, through: :votes, :source => :turtle, :foreign_key => :user_id

  validates :name, presence: true, uniqueness: true
  attr_accessible :name, :password, :password_confirmation

  has_secure_password

end
