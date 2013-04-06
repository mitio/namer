class SuggestionsController < ApplicationController
  respond_to :html
  before_filter :load_project, except: :index

  def index
    @suggestions = current_user.suggestions
  end

  def new
    @suggestion = scope.build
  end

  def create
    @suggestion      = scope.build params[:suggestion]
    @suggestion.ip   = request.remote_addr
    @suggestion.user = current_user

    if @suggestion.save
      flash[:notice] = "Your suggestion '#{@suggestion.name}' has been added."
    end

    respond_with @suggestion, location: project_url
  end

  def destroy
    @suggestion = scope.find params[:id]

    if @suggestion.destroyable_by? current_user
      @suggestion.destroy
      redirect_to project_url, notice: "The suggestion '#{@suggestion.name}' was deleted."
    else
      redirect_to project_url, alert: 'Can not delete a suggestion which has been voted for.'
    end
  end

  private

  def scope
    @project.suggestions
  end

  def project_url
    project_path @project
  end

  def load_project
    @project = Project.by_key params[:project_id]
  end
end
