class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_or_create_user

  private

  def load_or_create_user
    if cookies[:auth_token].present?
      @current_user = User.from_auth_token cookies[:auth_token], ip: request.remote_addr
    else
      cookies[:auth_token] = {value: KeyGenerator.generate, expires: 1.year.from_now}
      redirect_to url_for(params)
    end
  end

  def current_user
    @current_user
  end

  helper_method :current_user
end
