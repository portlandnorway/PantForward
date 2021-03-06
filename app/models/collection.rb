class Collection < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  #before_create :check_nil

  NEIGHBORHOODS = ['Bjerke', 'Bygdøy-Frogner', 'Bøler', 'Ekeberg-Bekkelaget', 'Furuset', 'Gamle Oslo', 'Grefsen - Kjelsås', 'Grorud', 'Grūnerløkka - Sofienberg', 'Hellerud','Helsfyr - Sinsen', 'Lambertseter', 'Manglerud', 'Marka', 'Nordstrand', 'Romsås', 'Røa', 'Sagene - Torshov', 'Sentrum', 'Sogn', 'Stovner', 'St. Hanshaugen - Ullevål', 'Søndre Nordstrand', 'Ullern', 'Uranienborg - Majorstuen', 'Vinderen', 'Østenjø']

  validates :address, :small_bottles, :big_bottles, presence: true
  validates :neighborhood, presence: true, inclusion: NEIGHBORHOODS
  validates :details, length: { maximum: 140,
    too_long: "%{count} characters is the maximum allowed" }

  geocoded_by :address

  before_validation :geocode, if: :will_save_change_to_address?

  validate :address_is_geocoded

  def reward_calculation_collection
    (big_bottles * 3) + (small_bottles * 2) + tip
  end


  def address_is_geocoded
    return if longitude && latitude

    errors.add(:address, 'Address not found. Please try again.')
  end
end
