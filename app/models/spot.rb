class Spot < ApplicationRecord
    belongs_to :user
    ratyrate_rateable "spot"
    mount_uploader :image, ImageUploader
end
