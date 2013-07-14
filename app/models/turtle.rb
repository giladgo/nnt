class Turtle < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_many :voted_users, through: :votes, :source => :user, :foreign_key => :turtle_id
  attr_accessible :description, :name, :score, :user, :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "/assets/:style/missing.png"

  def user_upvoted(user)
  	v = self.votes.find_by_user_id(user.id)
  	v.present? && v.upvote
  end

  def user_downvoted(user)
  	v = self.votes.find_by_user_id(user.id)
  	v.present? && !v.upvote
  end

  def avatar_thumb_url
    avatar.url(:thumb)
  end
end
