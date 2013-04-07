class Vote < ActiveRecord::Base
  cattr_reader :vote_types
  @@vote_types = %w( veto pass ok awesome )

  belongs_to :user
  belongs_to :suggestion

  delegate :project, to: :suggestion

  validates :vote, :user_id, :suggestion_id, presence: true
  validates :vote, inclusion: {in: vote_types}

  attr_accessible :vote
  after_initialize :set_default_vote_type

  def cast(params)
    self.attributes = params

    if vote == 'pass'
      if persisted?
        destroy
      else
        true
      end
    else
      save
    end
  end

  private

  def set_default_vote_type
    self.vote ||= 'pass' unless persisted?
  end
end
