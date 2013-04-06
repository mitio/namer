require 'digest/sha1'
require 'securerandom'

class KeyGenerator
  def self.generate
    Digest::SHA1.hexdigest "#{SecureRandom.base64} - #{Rails.configuration.secret_token}"
  end
end
