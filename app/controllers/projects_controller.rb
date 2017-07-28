class ProjectsController < ApplicationController
  before_action :access,:set_layout
  def index
    @projects = Project.all
  end
  def edit 
   @project = Project.find(params[:id])
  end
  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Your Post Is Live.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Your project Is Updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  def new
    @project = Project.new
  end
  def show
    @project = Project.find(params[:id])
  end
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was removed.' }
      format.json { head :no_content }
    end
  end
  def access
    if logged_in?(:site_admin)
      
    else
      redirect_to root_path
    end
  end
  def project_params
    params.require(:project).permit(:title,:description,:url)
  end
  def set_layout
    
  end
  
end