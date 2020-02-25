class Collection < ApplicationRecord
  validates :address, :bottles, presence: true

  enum status: [:available, :booked, :picked_up, :confirmed]

  belongs_to :donator, class_name: "User", foreign_key: :donator_id
  belongs_to :collector, class_name: "User", foreign_key: :collector_id
end
