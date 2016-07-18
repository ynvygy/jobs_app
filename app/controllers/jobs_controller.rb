class JobsController < ApplicationController
  before_action :authenticate_company
  before_action :authenticate_candidate

  def index
  	@jobs = Job.all
  end

  def new
  	@job = Job.new
  end

  def create
  	@job = Job.new(job_params)
  	if @job.save
  	  redirect_to @job
  	else
  	  render "new"
  	end
  end

  def show
  	@job = Job.find(params[:id])
  end

  def edit
  	@job = Job.find(params[:id])
  end

  def update
  	@job = Job.find(params[:id])
  	@job.update(job_params)
  	redirect_to @job
  end

  def destroy
  	@job = Job.find(params[:id])
  	@job.destroy
  	redirect_to :jobs
  end

  private

  def job_params
  	params.require(:job).permit(:name, :description, :budget, :location)
  end
end
