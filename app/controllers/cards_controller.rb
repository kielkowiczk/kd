class CardsController < ApplicationController
  before_filter :auth, :except => [:describe]
  
  def index
  end

  def new 
    @serie = Serie.find(params[:series_id])
    @card = Serie.find(params[:series_id]).cards.build

    for language in I18n.available_locales
      @card.opinions << Opinion.new(:language=>language.to_s)
    end

  end
  
  def create
    Serie.find(params[:series_id]).cards.create(params[:card])
    redirect_to series_path params[:series_id]
  end
  
  def show
    @serie = Serie.find(params[:series_id])
    @card = Serie.find(params[:series_id]).cards.find(params[:id])
    @description = Opinion.find(:first, :select=>:description, :conditions=>["language=? and card_id=?", I18n.locale.to_s, params[:id]]).description
  end
  
  def edit
    @serie = Serie.find(params[:series_id])
    @card = Serie.find(params[:series_id]).cards.find(params[:id])
  end
  
  def update
    card = Serie.find(params[:series_id]).cards.find(params[:id])
    card.update_attributes(params[:card])
    redirect_to series_path params[:series_id]
  end
  
  def destroy
    Serie.find(params[:series_id]).cards.find(params[:id]).destroy
    redirect_to series_path params[:series_id]
  end
  
  def describe
    @card = Serie.find(params[:serie_id]).cards.find(params[:card_id])
    @description = Opinion.find(:first, :select=>:description, :conditions=>["language=? and card_id=?", I18n.locale.to_s, params[:card_id]]).description
    render :layout => 'describe'
  end

end
