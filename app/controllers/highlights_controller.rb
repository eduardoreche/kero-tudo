class HighlightsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_celebration

  # GET /highlights
  # GET /highlights.json
  def index
    @highlights = @celebration.highlights

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: [@celebration,@highlights] }
    end
  end

  # GET /highlights/1
  # GET /highlights/1.json
  def show
    @highlight = @celebration.highlights.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: [@celebration,@highlights] }
    end
  end

  # GET /highlights/new
  # GET /highlights/new.json
  def new
    @highlight = @celebration.highlights.build
    set_highlight_end_date
    
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: [@celebration,@highlights] }
    end
  end

  # GET /highlights/1/edit
  def edit
    @highlight = @celebration.highlights.find(params[:id])
  end

  # POST /highlights
  # POST /highlights.json
  def create
    @highlight = @celebration.highlights.build(params[:highlight])

    respond_to do |format|
      if @highlight.save
        if params[:highlight][:cover_photo].present?
          format.html {render :crop}
        else
          format.html { redirect_to [@celebration,@highlight], notice: 'Highlight was successfully created.' }
          format.json { render json: [@celebration,@highlight], status: :created, location: [@celebration,@highlight] }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /highlights/1
  # PUT /highlights/1.json
  def update
    @highlight = @celebration.highlights.find(params[:id])

    respond_to do |format|
      if @highlight.update_attributes(params[:highlight])
        if params[:highlight][:cover_photo].present?
          format.html {render :crop}
        else
          crop
          
          format.html { redirect_to [@celebration,@highlight], notice: 'Highlight was successfully updated.' }
          format.json { head :no_content }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: [@celebration,@highlight].errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /highlights/1
  # DELETE /highlights/1.json
  def destroy
    @highlight = @celebration.highlights.find(params[:id])
    @highlight.destroy

    respond_to do |format|
      format.html { redirect_to admin_url }
      format.json { head :no_content }
    end
  end
  
  private
  def load_celebration
    @celebration = Celebration.find(params[:celebration_id])
  end
  
  def crop
    @highlight.reprocess_cover_photo
  end
  
  def set_highlight_end_date
    end_date = Date.new(Time.now.year, @celebration.month, @celebration.day)
    if( end_date < Date.today ) 
      end_date = end_date.next_year
    end
    
    @highlight.end_date = end_date
  end
  
end
