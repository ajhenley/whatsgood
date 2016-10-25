class SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  # GET /spots
  # GET /spots.json
  def index
    if params[:searchTerm] && params[:searchTerm].length > 0
      z = params[:searchTerm]
      z = z.downcase
      y = z.split(" ")

      if y.length > 4
        y = y[0, 4]
      end

      mc = ""
      wcSpotArray = Array.new

      y.each do |x|
        mc = buildWhereClause(mc,"lower(name) like ? or lower(description) like ? or lower(tags) like ?")
      end

      wcSpotArray.push "select * from spots where " + mc + " order by name ASC"
      y.each do |x|
        wcSpotArray.push "%" + x + "%"
        wcSpotArray.push "%" + x + "%"
        wcSpotArray.push "%" + x + "%"
      end

      wcEventArray = Array.new
      mc = ""

      y.each do |x|
        mc = buildWhereClause(mc,"lower(what) like ? or lower(description) like ? or lower(category) like ?")
      end

      d = DateTime.now
      d = d - 7.hours
      e = d.to_datetime

      mc = mc + " and whenend >= ? order by \"when\" limit 20"

      wcEventArray.push "select * from events where " + mc
      y.each do |x|
        wcEventArray.push "%" + x + "%"
        wcEventArray.push "%" + x + "%"
        wcEventArray.push "%" + x + "%"
      end

      wcEventArray.push e

      @spots = Spot.find_by_sql(wcSpotArray)
      @events = Event.find_by_sql(wcEventArray)
    else
      @spots = Spot.all
      @events = Array.new

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
    # @events = Event.where(spots_id: @spot.id)
    # (datetime_from_form.to_time - n.hours).to_datetime
    d = DateTime.now.in_time_zone
    d = d - 7.hours
    e = d.to_datetime
    @events = Event.find_by_sql ["select * from events where spots_id = ? and whenend >= ?  order by \"when\" ", @spot.id, e]
    byebug
    z=3
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
    def buildWhereClause(wc, ac)
      if wc.length > 0
        wc = wc + " or " + ac
      else
        wc = ac
      end
      return wc
    end

  # Use callbacks to share common setup or constraints between actions.
    def set_spot
      @spot = Spot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spot_params
      params.require(:spot).permit(:name, :hours, :phone, :address, :description, :social_twitter, :social_fb, :social_instagram, :social_pinsterest, :tags, :image)
    end
end
