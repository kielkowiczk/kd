class WidgetController < ApplicationController
  protect_from_forgery :except => :index
  layout "widget"
  include WidgetHelper
  
  def index
    @cards = Card.find(:all, :select=>"name, id, serie_id", :limit=>5, :order=>"id desc")
  end

  def update_widget
    @go=false
    
    unless params[:serie_selector1].blank?
      @selector_number = 1
      @go = true
    end

    unless params[:serie_selector2].blank?
      @selector_number = 2
      @go = true
    end

    unless params[:serie_selector3].blank?
      @selector_number = 3
      @go = true
    end

    unless params[:serie_selector4].blank?
      @selector_number = 4
      @go = true
    end

    if @go and 
      @serie_to_find = "serie_selector"+@selector_number.to_s
      @serie = Serie.find(params[@serie_to_find])
      @cards = @serie.cards
    end
    
    render :layout => false  
  end
  
  def search
   
    cards_to_find = Array.new

    if params[:cards_to_cmp].nil?
      1.upto(4) do |number|
        cards_to_find << [params["serie_#{number}"][:card], params[:card]["serie_selector_#{number}"]] if not params["serie_#{number}"][:card].blank? and not params[:card]["serie_selector_#{number}"].blank?
      end
    else
      if params[:from]=="kd" then
        @from_kd = true
      end
      cards_to_find = Array.new
      
      params[:cards_to_cmp].each do |row|
        cards_to_find << ActiveSupport::JSON.decode(row)
      end
      
    end

    compare_cards cards_to_find
    
    if @from_kd then
      @series = Serie.all.collect {|p| [ p.name, p.id ] unless Serie.find(p).cards.blank? } - [nil]
  	  @series.sort

      render :action => :kp 
    else
      render :layout => false
    end
  end
  
  def cmp
    @cards_hash = params[:query]
    
    @cards_to_compare = @cards_hash[:series].zip(@cards_hash[:cards])

  end
  
  def kp
    @series = Serie.all.collect {|p| [ p.name, p.id ] unless Serie.find(p).cards.blank? } - [nil]
  	@series.sort! {|a,b| b[0] <=> a[0]}
  end
  
  def kd
    
  end

  def kd_find_cards
    conditions = {}
    
    if params[:options] == "games"
      conditions[:to_office] = nil
      conditions[:to_movies] = nil
      conditions[:good_to_play_with_resoulution] = params[:resolution]
    elsif params[:options] == "movies"
      conditions[:to_office] = nil
      conditions[:to_movies] = 1
      conditions[:good_to_play_with_resoulution] = 0
    elsif params[:options] == "office"
      conditions[:to_office] = 1
      conditions[:to_movies] = nil 
      conditions[:good_to_play_with_resoulution] = 0 
    end

    @cards=Card.find(:all, :conditions=>["(is_low_profile = ? or good_to_overclocking = ? or is_quiet = ? or is_power_efficiant = ?) and (to_office = ? or to_movies = ? or good_to_play_with_resoulution = ?)", !! params[:is_low_profile], !! params[:good_to_overclocking], !! params[:is_quite], !! params[:is_power_efficiant], !! conditions[:to_office], !! conditions[:to_movies], conditions[:good_to_play_with_resoulution]])
    @cards.sort! { |a,b| b.name.downcase <=> a.name.downcase }

    render :layout=>false
  end

end
