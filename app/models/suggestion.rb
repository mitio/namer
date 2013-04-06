class Suggestion < ActiveRecord::Base
  belongs_to :naming_project

  validates :name, presence: true, uniqueness: {scope: :naming_project_id}

  attr_accessible :name

  scope :in_alphabetical_order, order(arel_table[:name].asc)
end
