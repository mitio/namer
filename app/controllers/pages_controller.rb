class PagesController < ApplicationController
  skip_before_filter :load_or_create_user

  def about
  end

  def privacy
  end
end
