class VotesController < ApplicationController
  before_filter :load_project_suggestion_and_vote

  def save
    @vote.cast params[:vote]

    if request.xhr?
      render action: 'save'
    else
      redirect_to @project
    end
  end

  alias create save
  alias update save

  private

  def load_project_suggestion_and_vote
    @project    = Project.by_key params[:project_id]
    @suggestion = @project.suggestions.find params[:suggestion_id]
    @vote       = @suggestion.vote_by current_user
  end
end
