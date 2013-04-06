class Suggestion < ActiveRecord::Base
  belongs_to :project

  validates :name, presence: true, uniqueness: {scope: :project_id}

  attr_accessible :name

  scope :in_alphabetical_order, order(arel_table[:name].asc)

  def destroyable?
    true
  end

  def destroyable_by?(user)
    destroyable? and ip == user
  end
end
