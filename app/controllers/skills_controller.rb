class SkillsController < ApplicationController
  before_action :access,:set_layout
  def index
    @skill = Skill.all
  end
  def edit 
   @skill = Skill.find(params[:id])
  end
  def create
    @skill = Skill.new(skill_params)
    respond_to do |format|
      if @skill.save
        format.html { redirect_to @skill, notice: 'Your Skill Is Live.' }
        format.json { render :show, status: :created, location: @skill }
      else
        format.html { render :new }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    @skill = Skill.find(params[:id])
    respond_to do |format|
      if @skill.update(job_params)
        format.html { redirect_to @skill, notice: 'Your Skill Is Updated.' }
        format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end
  def new
    @skill = Skill.new
  end
  def show
    @skill = Skill.find(params[:id])
  end
  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_url, notice: 'Skill was removed.' }
      format.json { head :no_content }
    end
  end
  def access
    if logged_in?(:site_admin)
      
    else
      redirect_to root_path
    end
  end
  def skill_params
    params.require(:skill).permit(:title,:percent_utilized)
  end
  def set_layout
    
  end
  
end