class Project < ActiveRecord::Base
  has_many :suggestions, dependent: :destroy

  validates :key, presence: true, uniqueness: true
  validates :description, presence: true

  attr_accessible :description

  before_validation :set_key
  before_create :set_key

  class << self
    def by_key(key)
      where(key: key).first or raise ActiveRecord::RecordNotFound
    end
  end

  def to_param
    key
  end

  def display_name
    "project #{key[0..10]}..."
  end

  private

  def set_key
    self.key ||= KeyGenerator.generate
  end
end
