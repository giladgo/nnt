class Vote < ActiveRecord::Base
  attr_accessible :turtle_id, :user_id, :upvote
  belongs_to :turtle
  belongs_to :user

  validates_uniqueness_of :turtle_id, :scope => :user_id

  before_create :update_score
  before_destroy :update_score
  after_find :mark_read_only

  def self.vote_for(user, turtle, upvote)
  end

  def self.unvote_for(user, turtle)
  end

protected

  def mark_read_only
    self.readonly!
  end

  def add_score
    self.turtle.change_score(vote_score)
  end

  def remove_score
    self.turtle.change_score(-vote_score)
  end

  def vote_score
    self.upvote ? 1 : -1
  end
end
