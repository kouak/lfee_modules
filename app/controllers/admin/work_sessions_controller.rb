class Admin::WorkSessionsController < ApplicationController
  def index
    @admin/work_sessions = Admin::WorkSessions.all
  end
  
  def show
    @admin/work_sessions = Admin::WorkSessions.find(params[:id])
  end
  
  def new
    @admin/work_sessions = Admin::WorkSessions.new
  end
  
  def create
    @admin/work_sessions = Admin::WorkSessions.new(params[:admin/work_sessions])
    if @admin/work_sessions.save
      flash[:notice] = "Successfully created admin/work sessions."
      redirect_to @admin/work_sessions
    else
      render :action => 'new'
    end
  end
  
  def edit
    @admin/work_sessions = Admin::WorkSessions.find(params[:id])
  end
  
  def update
    @admin/work_sessions = Admin::WorkSessions.find(params[:id])
    if @admin/work_sessions.update_attributes(params[:admin/work_sessions])
      flash[:notice] = "Successfully updated admin/work sessions."
      redirect_to @admin/work_sessions
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @admin/work_sessions = Admin::WorkSessions.find(params[:id])
    @admin/work_sessions.destroy
    flash[:notice] = "Successfully destroyed admin/work sessions."
    redirect_to admin/work_sessions_url
  end
end
