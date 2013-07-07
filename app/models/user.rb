class User < ActiveRecord::Base
  has_many :votes
  has_many :uploaded_turtles, :source => :turtle, :foreign_key => :user_id
  has_many :voted_turtles, through: :votes, :source => :turtle, :foreign_key => :user_id

  validates :name, presence: true, uniqueness: true
  attr_accessible :name, :password

  def authenticate(password)
  	password == self.password
  end

  # returns :upvote, :downvote or :novote
  def vote_for(turtle)
  end

end
