class GiftsController < ApplicationController
  
  def index
    @products = Product.order('created_at desc').page(params[:page]).per(12)
    
    @tags = Tag.order(:name)
    @groups = Group.order(:name)
  end
  
  def filter
    @what = params[:what]
    @who = params[:who]
    
    puts "who: #{@who.blank?}"
    puts "what: #{@what.blank?}"
    
    if !@what.blank? and @who.blank?
      @products = Product.filtered_by_group(@what.split(",")) 
    elsif @what.blank? and !@who.blank?
      @products = Product.filtered_by_tag(@who.split(",")) 
    else
      @products = Product.filtered_by_group(@what.split(",")).
                    filtered_by_tag(@who.split(","))
    end
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
end
