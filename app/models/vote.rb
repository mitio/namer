class Vote < ActiveRecord::Base
  cattr_reader :vote_types
  @@vote_types = %w( veto pass ok awesome )

  belongs_to :user
  belongs_to :suggestion

  delegate :project, to: :suggestion

  validates :vote, :user_id, :suggestion_id, presence: true
  validates :vote, inclusion: {in: vote_types}

  attr_accessible :vote
end
