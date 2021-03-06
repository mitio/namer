module UserManagement
  def load_or_create_user
    if cookies[:auth_token].present?
      if params[:cookie].present?
        redirect_to url_for(params.except(:cookie))
      else
        @current_user = User.from_auth_token cookies[:auth_token], ip: request.remote_ip
      end
    elsif params[:cookie].present?
      redirect_to privacy_pages_path
    else
      cookies[:auth_token] = {value: KeyGenerator.generate, expires: 1.year.from_now}
      redirect_to url_for(params.merge(cookie: 1))
    end
  end

  def set_auth_token_from_params
    if params[:auth_token].present?
      cookies[:auth_token] = {value: params[:auth_token], expires: 1.year.from_now}
      redirect_to url_for(params.except(:auth_token).merge(cookie: 1))
    end
  end

  def current_user
    @current_user
  end
end
