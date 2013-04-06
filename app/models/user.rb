class User < ActiveRecord::Base
  has_many :projects, dependent: :destroy
  has_many :suggestions
  has_many :votes, dependent: :destroy

  validates :authentication_token, presence: true, uniqueness: true

  class << self
    def from_auth_token(auth_token, options = {})
      user = where(authentication_token: auth_token.to_s).first

      unless user
        user = new
        user.authentication_token = auth_token
        user.ip = options[:ip]
        user.save!
      end

      user
    end
  end
end
