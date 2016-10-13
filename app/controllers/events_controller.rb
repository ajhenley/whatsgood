class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all

  end

  # GET /events/1
  # GET /events/1.json
  def show
    @spot = Spot.find(@event.spots_id)
  end

  # GET /events/new
  def new
    @event = Event.new

    if params[:original]
      orig = Event.find(params[:original])
      @event.what = orig.what
      @event.description = orig.description
      @event.when = orig.when
      @event.image = orig.image
      @event.category = orig.category
      @event.link = orig.link
      @event.whenend = orig.whenend
      @event.happensat = orig.happensat
      @event.spots_id = orig.spots_id
      @spot = Spot.find(orig.spots_id)
      @title = "Copied Event"
      @button = "Save Copied Event"
    else
      @title = "New Event"
      @button = "Create Event"
      @spot = Spot.find(params[:spots_id])
    end
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    byebug
    myev = Hash.new()
    myev["what"] = event_params["what"]
    myev["description"] = event_params["description"]
    myev["image"] = event_params["image"]
    myev["category"] = event_params["category"]
    myev["link"] = event_params["link"]
    myev["when"] = DateTime.new(event_params["when(1i)"].to_i,
                                event_params["when(2i)"].to_i,
                                event_params["when(3i)"].to_i,
                                event_params["when(4i)"].to_i,
                                event_params["when(5i)"].to_i)
    myev["whenend"] = DateTime.new(event_params["whenend(1i)"].to_i,
                                   event_params["whenend(2i)"].to_i,
                                   event_params["whenend(3i)"].to_i,
                                   event_params["whenend(4i)"].to_i,
                                   event_params["whenend(5i)"].to_i)
    byebug
    @spot = Spot.find(event_params["spots_id"].to_i)
    myev["spots_id"] = event_params["spots_id"]
    myev["happensat"] = @spot.name

    evlist = []
    evlist << myev
    if event_params.key?("duplicate") && event_params["duplicate"] != "none" && event_params["repcount"].to_i > 0
      dupmeth = event_params["duplicate"]
      dupnum = event_params["repcount"].to_i
      (1..dupnum).each do |i|
        #byebug
        myev1 = myev.clone
        myev = []
        myev = myev1
        if dupmeth == "everyday"
          myev["when"] = findNextDay(myev["when"])
          myev["whenend"] = findNextDay(myev["whenend"])
        elsif dupmeth == "everyweekday"
          myev["when"] = findNextWeekday(myev["when"])
          myev["whenend"] = findNextWeekday(myev["whenend"])
        elsif dupmeth == "everyweek"
          myev["when"] = findNextWeekSameDay(myev["when"])
          myev["whenend"] = findNextWeekSameDay(myev["whenend"])
        elsif dupmeth == "everyweekendday"
          myev["when"] = findNextWeekendDay(myev["when"])
          myev["whenend"] = findNextWeekendDay(myev["whenend"])
        end
        evlist << myev
      end
    end
    respond_to do |format|
      Event.transaction do
        success = evlist.map do |hash|
          object = Event.new(hash)
          object.save
        end
        unless success.all?
            raise ActiveRecord::Rollback
            format.html { render :new }
            format.json { render json: @event.errors, status: :unprocessable_entity }
        else
          format.html { redirect_to @spot, notice: 'Event(s) successfully created.' }
          format.json { render :show, status: :created, location: @event }
        end
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

  def findNextWeekday(nowdate)
    i = 1
    while (nowdate+i).saturday? || (nowdate+i).sunday? do
      i += 1
    end
    return nowdate + i
  end

  def findNextWeekendDay(nowdate)
    i = 1
    until (nowdate+i).saturday? || (nowdate+i).sunday? do
      i += 1
    end
    return nowdate + i
  end

  def findNextDay(nowdate)
    i = 1
    return nowdate + i
  end

  def findNextWeekSameDay(nowdate)
    i = 7
    return nowdate + i
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:what, :description, :when, :whenend, :spots_id, :image, :category, :spots_id, :link, :repcount, :duplicate)
    end
end
