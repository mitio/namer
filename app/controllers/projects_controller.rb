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
    @project.ip = request.remote_ip

    if @project.save
      flash[:notice] = flash_message('created')
    end

    respond_with @project
  end

  def show
    @project = Project.by_key params[:id]
  end

  def edit
  end

  def update
    if @project.update_attributes params[:project]
      flash[:notice] = flash_message('updated')
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
