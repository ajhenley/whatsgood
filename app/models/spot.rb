class Spot < ApplicationRecord
    belongs_to :user
    ratyrate_rateable "spot"
end
