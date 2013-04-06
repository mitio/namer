require 'digest/sha1'
require 'securerandom'

class NamingProject < ActiveRecord::Base
  has_many :suggestions, dependent: :destroy
  validate :key, presence: true, uniqueness: true
  attr_accessible :description
  before_create :set_key

  class << self
    def by_key(key)
      where(key: key).first or raise ActiveRecord::RecordNotFound
    end
  end

  private

  def set_key
    self.key = Digest::SHA1.hexdigest "#{SecureRandom.base64} - #{Rails.configuration.secret_token}"
  end
end
