class HomeController < ApplicationController
  layout "home"
  
  def main
    @cards = Card.find(:all, :order=>"id desc", :limit=>5)
  end

end
