class Vote < ActiveRecord::Base
  attr_accessible :turtle_id, :user_id, :upvote
  belongs_to :turtle
  belongs_to :user

  validates_uniqueness_of :turtle_id, :scope => :user_id

  before_create :add_score
  before_destroy :remove_score
  after_find :mark_read_only

protected

  def mark_read_only
    self.readonly!
  end

  def score
    self.upvote ? 1 : -1
  end

  def add_score
    self.turtle.change_score(score)
  end

  def remove_score
    self.turtle.change_score(-score)
  end
end
