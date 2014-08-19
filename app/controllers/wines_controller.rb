class WinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy]

  # GET /wines
  # GET /wines.json
  def index
    @wines = Wine.all
  end

  # GET /wines/1
  # GET /wines/1.json
  def show
  end

  # GET /wines/new
  def new
    @wine = Wine.new
  end

  # GET /wines/1/edit
  def edit
  end

  # POST /wines
  # POST /wines.json
  def create
    @wine = Wine.new(wine_params)

    respond_to do |format|
      if @wine.save
        format.html { redirect_to @wine, notice: 'Wine was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wine }
      else
        format.html { render action: 'new' }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wines/1
  # PATCH/PUT /wines/1.json
  def update
    respond_to do |format|
      if @wine.update(wine_params)
        format.html { redirect_to @wine, notice: 'Wine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1
  # DELETE /wines/1.json
  def destroy
    @wine.destroy
    respond_to do |format|
      format.html { redirect_to wines_url }
      format.json { head :no_content }
    end
  end

  def get_grape_varieties
    grape_varieties = []
    if params[:color] == 'Red'
      grape_varieties = [
        'Merlot', 
        'Cabernet Sauvignon', 
        'Pinot Noir', 
        'Syrah', 
        'Shiraz', 
        'Zinfandel'
        ].sort
      respond_to do |format|
        format.js { render :json => grape_varieties}
      end
    elsif params[:color] == 'White'
      grape_varieties = [
        'Chardonnay', 
        'Moscato', 
        'Sauvignon Blanc', 
        'Riesling', 
        'Pinot Grigio', 
        'Chenin Blanc', 
        'Champagne', 
        'Muscat'
        ].sort
      respond_to do |format|
        format.js { render :json => grape_varieties}
      end
    else
      grape_varieties = [
        'White Zinfandel', 
        'Champagne'].sort
      respond_to do |format|
        format.js { render :json => grape_varieties}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wine_params
      params.require(:wine).permit(:brand, :grape_variety, :year, :picture, :rating, :description, :color, :bubbly)
    end
end
