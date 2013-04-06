class ProjectsController < ApplicationController
  respond_to :html
  before_filter :load_user_project, only: [:edit, :update]

  def index
    @projects = scope
  end

  def new
    @project = scope.build
  end

  def create
    @project = scope.build params[:project]
    @project.ip = request.remote_addr

    if @project.save
      flash[:notice] = 'The naming project has been created.'
    end

    respond_with @project
  end

  def show
    @project = Project.by_key params[:id]
  end

  def edit
    @project = scope.by_key params[]
  end

  def update
    if @project.update_attributes params[:project]
      flash[:notice] = 'Your changes have been saved.'
    end

    respond_with @project
  end

  private

  def scope
    current_user.projects
  end

  def load_user_project
    @project = scope.by_key params[:id]
  end
end
