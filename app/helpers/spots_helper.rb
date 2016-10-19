module SpotsHelper
    def isSpotOwner(spotid)
      spot = Spot.find(spotid)
      spot.user_id == current_user.id
    end
end
