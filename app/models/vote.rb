class Vote < ActiveRecord::Base
  attr_accessible :turtle_id, :user_id, :upvote
  belongs_to :turtle
  belongs_to :user

  validates_uniqueness_of :turtle_id, :scope => :user_id

  before_create :add_score
  before_destroy :remove_score
  before_save :do_not_update

protected
  def do_not_update
  	self.new_record?
  end

  def add_score
    self.turtle.reload
    self.turtle.score += (self.upvote ? 1 : -1)
    self.turtle.save
  end

  def remove_score
  	self.turtle.reload
  	self.turtle.score -= (self.upvote ? 1 : -1)
  	self.turtle.save
  end
end