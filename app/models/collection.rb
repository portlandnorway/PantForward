class Collection
  belongs_to :user
  validates :address, :bottles, presence: true
end
