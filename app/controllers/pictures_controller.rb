class PicturesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_product
    
  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = @product.pictures

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: [@product,@pictures] }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = @product.pictures.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: [@product,@picture] }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @picture = @product.pictures.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @picture = @product.pictures.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = @product.pictures.build(params[:picture])
    @picture.save
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update
    @picture = @product.pictures.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to product_pictures_path(@product), notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = @product.pictures.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to product_pictures_url(@product) }
      format.json { head :no_content }
    end
  end
  
  private
  def load_product
    @product = Product.find(params[:product_id])
  end
end
