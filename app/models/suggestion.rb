class Suggestion < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :votes

  validates :name, presence: true, uniqueness: {scope: :project_id}

  attr_accessible :name

  scope :in_alphabetical_order, order(arel_table[:name].asc)

  def vote_by(user)
    vote = votes.where(user_id: user.id).first

    unless vote
      vote = votes.build
      vote.user = user
    end

    vote
  end

  def rank
    votes.select(&:persisted?).sum(&:rank)
  end

  def vetoes
    votes.to_a.count(&:veto?)
  end

  def has_veto?
    vetoes > 0
  end

  def destroyable?
    votes.select(&:persisted?).none?
  end

  def destroyable_by?(user)
    destroyable? and owned_by?(user)
  end

  def owned_by?(user)
    self.user == user
  end

  def votes_with_reason
    votes.select(&:has_reason?).sort_by(&:updated_at)
  end

  def public_comments?
    project.public_comments?
  end

  def vote_counts
    votes_by_type = votes.group_by(&:vote).map { |type, votes| [type, votes.size] }.sort_by { |type, _| Vote.vote_types.index(type) }
    Hash[votes_by_type]
  end
end
