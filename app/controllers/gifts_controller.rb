class GiftsController < ApplicationController
  
  layout "gifts"
  
  def index
    session[:groups] = []
    session[:tags] = []
      
    load_data_and_render_page
  end

  def filter
    session[:groups] << params[:group].to_i if !params[:group].blank?
    session[:groups] = session[:groups].uniq
    
    session[:tags] << params[:tag].to_i if !params[:tag].blank?
    session[:tags] = session[:tags].uniq
    
    load_data_and_render_page
  end
  
  def remove_filter
    session[:groups].delete(params[:group].to_i) if !params[:group].blank? and session[:groups]
    session[:tags].delete(params[:tag].to_i) if !params[:tag].blank? and session[:tags]
    
    load_data_and_render_page
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  private
  def load_tags_and_groups
    @tags = Tag.joins(:taggings => :product).uniq.order(:name)
    @groups = Group.joins(:products).uniq.order(:name)
  end
  
  def load_filter
    @tag_filter = Tag.where(id: session[:tags]).order(:name)
    @group_filter = Group.where(id: session[:groups]).order(:name)
  end
  
  def load_products
    if session[:tags].empty? and session[:groups].empty?
      @products = Product.order('created_at desc').page(params[:page]).per(28)
    elsif !session[:groups].empty? and session[:tags].blank?
      @products = Product.filtered_by_group(session[:groups].join(',')).page(params[:page]).per(28)
    elsif session[:groups].empty? and !session[:tags].blank?
      @products = Product.filtered_by_tag(session[:tags].join(',')).page(params[:page]).per(28)
    else
      @products = Product.filtered_by_tag(session[:tags].join(',')).
                          filtered_by_group(session[:groups].join(',')).page(params[:page]).per(28)
    end
  end
  
  def load_data_and_render_page
    load_filter
    load_products  
    load_tags_and_groups
    
    render :index
  end
  
end
