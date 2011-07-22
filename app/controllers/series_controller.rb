class SeriesController < ApplicationController
  before_filter :auth
  
  def index
    @series = Serie.all
  end
  
  def new
    @serie = Serie.new
  end
  
  def show
    @serie = Serie.find(params[:id])
  end
  
  def create
    Serie.create params[:serie]
    redirect_to :action => :index
  end
  
  def edit
    @serie = Serie.find(params[:id])
  end

  def update
    Serie.find(params[:id]).update_attributes params[:serie]
    
    redirect_to :action => :index
  end

  def destroy
    Serie.find(params[:id]).destroy
    
    redirect_to :action => :index
  end
  
end
