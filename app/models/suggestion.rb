class Suggestion < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :votes

  validates :name, presence: true, uniqueness: {scope: :project_id}

  attr_accessible :name

  scope :in_alphabetical_order, order(arel_table[:name].asc)

  def vote_for(user)
    vote = votes.where(user_id: user.id).first

    unless vote
      vote = votes.build
      vote.user = user
    end

    vote
  end

  def destroyable?
    votes.none?
  end

  def destroyable_by?(user)
    destroyable? and owned_by?(user)
  end

  def owned_by?(user)
    self.user == user
  end
end
