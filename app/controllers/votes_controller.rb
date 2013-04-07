class VotesController < ApplicationController
  before_filter :load_project_suggestion_and_vote

  def create
    @vote.cast params[:vote]
    redirect_to @project
  end

  alias update create

  private

  def load_project_suggestion_and_vote
    @project    = Project.by_key params[:project_id]
    @suggestion = @project.suggestions.find params[:suggestion_id]
    @vote       = @suggestion.vote_by current_user
  end
end
