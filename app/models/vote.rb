class Vote < ActiveRecord::Base
  cattr_reader :vote_types
  @@vote_types = %w( veto pass ok awesome )

  belongs_to :user
  belongs_to :suggestion

  delegate :project, to: :suggestion

  validates :vote, :user_id, :suggestion_id, presence: true
  validates :vote, inclusion: {in: vote_types}
  validates :reason, presence: true, if: :veto?

  attr_accessible :vote, :reason
  after_initialize :set_default_vote_type

  def cast(params)
    self.attributes = params

    if vote == 'pass' and reason.blank?
      if persisted?
        destroy
      else
        true
      end
    else
      save
    end
  end

  def rank
    case vote
    when 'ok'       then 1
    when 'awesome'  then 3
    else                 0
    end
  end

  def veto?
    vote == 'veto'
  end

  def has_reason?
    reason.present?
  end

  private

  def set_default_vote_type
    self.vote ||= 'pass' unless persisted?
  end
end
