class Collection < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  geocoded_by :address
  validates :address, :bottles, presence: true
  after_validation :geocode, if: :will_save_change_to_address?

  enum status: [:available, :booked, :picked_up, :confirmed]
end
