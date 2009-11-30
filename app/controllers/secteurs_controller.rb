class SecteursController < ApplicationController
  def index
    @secteurs = Secteur.all
  end
  
  def show
    @secteur = Secteur.find(params[:id])
  end
  
  def new
    @secteur = Secteur.new
  end
  
  def create
    @secteur = Secteur.new(params[:secteur])
    if @secteur.save
      flash[:notice] = "Successfully created secteur."
      redirect_to @secteur
    else
      render :action => 'new'
    end
  end
  
  def edit
    @secteur = Secteur.find(params[:id])
  end
  
  def update
    @secteur = Secteur.find(params[:id])
    if @secteur.update_attributes(params[:secteur])
      flash[:notice] = "Successfully updated secteur."
      redirect_to @secteur
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @secteur = Secteur.find(params[:id])
    @secteur.destroy
    flash[:notice] = "Successfully destroyed secteur."
    redirect_to secteurs_url
  end
end
