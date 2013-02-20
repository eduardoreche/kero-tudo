class GiftsController < ApplicationController
  def index
    @products = Product.order('created_at desc').page(params[:page]).per(12)
    
    @tags = Tag.order(:name)
    
    @groups = Group.order(:name)
  end
end
