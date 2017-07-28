class JobsController < ApplicationController
  before_action :access,:set_layout
  def index
    @jobs = Job.all
  end
  def edit 
   @job = Job.find(params[:id])
  end
  def create
    @job = Job.new(job_params)
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Your Job Is Live.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    @job = Job.find(params[:id])
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Your job Is Updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end
  def new
    @job = Job.new
  end
  def show
    @job = Job.find(params[:id])
  end
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was removed.' }
      format.json { head :no_content }
    end
  end
  def access
    if logged_in?(:site_admin)
      
    else
      redirect_to root_path
    end
  end
  def job_params
    params.require(:job).permit(:title,:description)
  end
  def set_layout
    
  end
  
end