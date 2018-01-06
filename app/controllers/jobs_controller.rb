class JobsController < ApplicationController
  before_action :require_sign_in
  
  def index
    @jobs = policy_scope(Job)
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end
  
  def create 
    @job = Job.new(job_params)
    @job.user = current_user
    
    if @job.save
      flash[:notice] = "Job was saved."
      redirect_to [@job]
    else
      flash.now[:alert] = "There was an error saving your job. Please try again."
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end
  
  def update 
    @job = Job.find(params[:id])
    @job.assign_attributes(job_params)
    
    if @job.save
      flash[:notice] = "Job was updated."
      redirect_to @job
    else
      flash.now[:alert] = "There was an error saving the job. Please try again."
    end
  end
  
  def destroy
    @job = Job.find(params[:id])
  
    if @job.destroy
      flash[:notice] = "The job was deleted successfully."
      redirect_to jobs_path
    else
      flash[:alert] = "There was an error deleting the job."
      render :show
    end
  end
  
  private 
  
  def job_params
    params.require(:job).permit(:address, :yardsize, :date, :specialrequests, :stripes, :grasstreated, :mulching, :mulchexisting, :newbushestrees, :rate, :status, :paid, :notes)
  end
end
