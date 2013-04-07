require_dependency 'translated_flash_messages'

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_or_create_user

  private

  include TranslatedFlashMessages
  include UserManagement
  helper_method :current_user
end
