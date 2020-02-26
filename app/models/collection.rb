class Collection < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :address, :small_bottles, :big_bottles, presence: true

  NEIGHBORHOODS = ['Bjerke', 'Bygdøy-Frogner', 'Bøler', 'Ekeberg-Bekkelaget', 'Furuset', 'Gamle Oslo', 'Grefsen - Kjelsås', 'Grorud', 'Grūnerløkka - Sofienberg', 'Hellerud','Helsfyr - Sinsen', 'Lambertseter', 'Manglerud', 'Marka', 'Nordstrand', 'Romsås', 'Røa', 'Sagene - Torshov', 'Sentrum', 'Sogn', 'Stovner', 'St. Hanshaugen - Ullevål', 'Søndre Nordstrand', 'Ullern', 'Uranienborg - Majorstuen', 'Vinderen', 'Østenjø']

  validates :neighborhood, presence: true, inclusion: NEIGHBORHOODS

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  enum status: [:available, :booked, :picked_up, :confirmed]

end
