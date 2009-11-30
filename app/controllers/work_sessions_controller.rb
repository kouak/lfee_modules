class WorkSessionsController < ApplicationController
  filter_resource_access
  
  def index
    @work_sessions = WorkSession.all
  end
  
  def show
    @work_session = WorkSession.find(params[:id])
  end
  
  def new
    @work_session = WorkSession.new
  end
  
  def create
    @work_session = WorkSession.new(params[:work_session])
    if @work_session.save
      flash[:notice] = "Successfully created work session."
      redirect_to @work_session
    else
      render :action => 'new'
    end
  end
  
  def edit
    @work_session = WorkSession.find(params[:id])
  end
  
  def update
    @work_session = WorkSession.find(params[:id])
    if @work_session.update_attributes(params[:work_session])
      flash[:notice] = "Successfully updated work session."
      redirect_to @work_session
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @work_session = WorkSession.find(params[:id])
    @work_session.destroy
    flash[:notice] = "Successfully destroyed work session."
    redirect_to work_sessions_url
  end
end
