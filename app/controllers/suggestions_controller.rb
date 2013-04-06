class SuggestionsController < ApplicationController
  respond_to :html
  before_filter :load_naming_project

  def new
    @suggestion = scope.build
  end

  def create
    @suggestion = scope.build params[:suggestion]
    @suggestion.ip = request.remote_addr

    if @suggestion.save
      flash[:notice] = "Your suggestion '#{@suggestion.name}' has been added."
    end

    respond_with @suggestion, location: project_url
  end

  def destroy
    @suggestion = scope.find params[:id]

    if @suggestion.destroyable?
      @suggestion.destroy
      redirect_to project_url, notice: "The suggestion '#{@suggestion.name}' was deleted."
    else
      redirect_to project_url, alert: 'Can not delete a suggestion which has been voted for.'
    end
  end

  private

  def scope
    @naming_project.suggestions
  end

  def project_url
    naming_project_path @naming_project
  end

  def load_naming_project
    @naming_project = NamingProject.by_key params[:naming_project_id]
  end
end
