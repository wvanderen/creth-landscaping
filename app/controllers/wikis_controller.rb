class WikisController < ApplicationController
  before_action :require_sign_in, except: [:index, :show]
  #authorize_user, except: [:index, :show]
  
  def index
    @wikis = policy_scope(Wiki)
  end
  
  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    @collaborators = @wiki.collaborators.build
    
  end
  
  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    
    if @wiki.save
      flash[:notice] = "Wiki was saved."
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
    @wiki.assign_attributes(wiki_params)
    
    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
    end
  end
  
  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end
  
  def add_collaborator
    @wiki.collaborators << @collaborator
  end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private, :collaborators)
  end
  
end
