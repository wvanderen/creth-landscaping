class WikisController < ApplicationController
  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end
  
  def create
    @wiki = Wiki.build(wiki_params)
    @wiki.user = current_user
    
    if @wiki.save
      flash[:notice] = "Wii was saved."
      redirect_to [@wiki]
    else 
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes()
  end
  
  def destroy
    
  end
end
