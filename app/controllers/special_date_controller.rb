class SpecialDateController < ApplicationController
  
  rescue_from "Exception", with: :to_root
  
  def index
    @highlight = Highlight.find(params[:id])
      
    @products = Product.joins(:tags).where('tag_id in (?)', @highlight.celebration.tags ).page(params[:page]).per(28)
  end
  
  private
  def to_root
    redirect_to root_path
  end
end
