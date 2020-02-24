class Collection < ApplicationRecord
  belongs_to :user
  validates :address, :bottles, presence: true

  enum status: [:available, :booked, :picked_up, :confirmed]
end
