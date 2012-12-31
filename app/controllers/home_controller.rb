class HomeController < ApplicationController
  layout "site"
  
  def index
    current_highlights
    
    latest_products
  end
  
  private
  def current_highlights
    @highlights = Highlight.where("'#{Date.today}' between start_date and end_date ")
  end
  
  def latest_products
    @products = Product.order('created_at desc').limit(24)
  end
end
