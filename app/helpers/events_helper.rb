module EventsHelper
  def isEventOwner(eventid)
    myuser = current_user.id
    spot = Spot.find(@event.spots_id)
    spot.user_id == myuser
  end
end
