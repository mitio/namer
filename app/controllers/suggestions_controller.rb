class SuggestionsController < ApplicationController
  respond_to :html
  before_filter :load_naming_project

  def new
    @suggestion = @naming_project.suggestions.build
  end

  def create
    @suggestion = @naming_project.suggestions.build params[:suggestion]
    @suggestion.ip = request.remote_addr
    @suggestion.save

    respond_with @suggestion, location: naming_project_path(@naming_project)
  end

  private

  def load_naming_project
    @naming_project = NamingProject.by_key params[:naming_project_id]
  end
end
