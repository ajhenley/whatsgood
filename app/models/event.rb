class Event < ApplicationRecord
#  belongs_to :spots
  mount_uploader :image, EventImageUploader
  validate :start_date_before_end_date

  def start_date_before_end_date
    if self.when > whenend
      errors.add(:when, "Start date should be before end date")
    end
  end
end
