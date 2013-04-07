class ResultsController < ApplicationController
  respond_to :html

  def show
    @project = current_user.projects.by_key params[:project_id]
  end
end
