class ProjectsController < ApplicationController
  respond_to :html
  before_filter :load_project, only: [:show, :edit, :update]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new params[:project]
    @project.ip = request.remote_addr

    if @project.save
      flash[:notice] = 'The naming project has been created.'
    end

    respond_with @project
  end

  def show
  end

  def edit
  end

  def update
    if @project.update_attributes params[:project]
      flash[:notice] = 'Your changes have been saved.'
    end

    respond_with @project
  end

  private

  def load_project
    @project = Project.by_key params[:id]
  end
end
