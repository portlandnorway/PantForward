class Collection < ApplicationRecord
  geocoded_by :address
  validates :address, :bottles, presence: true
  after_validation :geocode, if: :will_save_change_to_address?

  enum status: [:available, :booked, :picked_up, :confirmed]

  # belongs_to :donator, class_name: "User", foreign_key: :donator_id
  # belongs_to :collector, class_name: "User", foreign_key: :collector_id
end
