class NamingProjectsController < ApplicationController
  respond_to :html
  before_filter :load_naming_project, only: [:show, :edit, :update]

  def new
    @naming_project = NamingProject.new
  end

  def create
    @naming_project = NamingProject.new params[:naming_project]
    @naming_project.ip = request.remote_addr
    @naming_project.save

    respond_with @naming_project
  end

  def show
  end

  def edit
  end

  def update
    @naming_project.update_attributes params[:naming_project]

    respond_with @naming_project
  end

  private

  def load_naming_project
    @naming_project = NamingProject.by_key params[:id]
  end
end
