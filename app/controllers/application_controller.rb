class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    request.remote_addr
  end

  helper_method :current_user
end
