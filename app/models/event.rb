class Event < ApplicationRecord
#  belongs_to :spots
  mount_uploader :image, EventImageUploader
end
