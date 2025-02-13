class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy] # nice syntax thing
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  def index
    @projects = Current.user.joined_projects
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Current.user.projects.build(project_params)
    if @project.save
      ProjectMembership.create(user: Current.user, project: @project, role: "owner")
      redirect_to @project, notice: "Project created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: "Project deleted."
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def authorize_user!
    unless @project.members.include?(Current.user)
      redirect_to projects_path, alert: "You do not have access to this project."
    end
  end
end
