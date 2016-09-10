class SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  # GET /spots
  # GET /spots.json
  def index
    if params[:searchTerm]
      st = "%" + params[:searchTerm] + "%"
      @spots = Spot.find_by_sql(["select * from spots where name like ? or description like ? or tags like ?", st, st, st])
    else
      @spots = Spot.all
    end
  end

  # GET /spots
  # GET /spots.json
  def myindex
    @spots = Spot.where(user_id:current_user.id)
    if !@spots.any?
      redirect_to :action => "index"
    end
  end

  # GET /spots/1
  # GET /spots/1.json
  def show
    @events = Event.where(spots_id: @spot.id)
  end

  # GET /spots/new
  def new
    @spot = Spot.new
  end

  # GET /spots/1/edit
  def edit
  end

  # POST /spots
  # POST /spots.json
  def create
    @spot = Spot.new(spot_params)
    @spot.user = current_user
    @spot.user_id = current_user.id
    respond_to do |format|
      if @spot.save
        format.html { redirect_to @spot, notice: 'Spot was successfully created.' }
        format.json { render :show, status: :created, location: @spot }
      else
        format.html { render :new }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spots/1
  # PATCH/PUT /spots/1.json
  def update
    respond_to do |format|
      if @spot.update(spot_params)
        format.html { redirect_to @spot, notice: 'Spot was successfully updated.' }
        format.json { render :show, status: :ok, location: @spot }
      else
        format.html { render :edit }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spots/1
  # DELETE /spots/1.json
  def destroy
    @spot.destroy
    respond_to do |format|
      format.html { redirect_to spots_url, notice: 'Spot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spot
      @spot = Spot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spot_params
      params.require(:spot).permit(:name, :hours, :phone, :address, :description, :social_twitter, :social_fb, :social_instagram, :social_pinsterest, :tags, :image)
    end
end
