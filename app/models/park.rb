class Park < ApplicationRecord
  
  has_many :park_facilities
  has_many :facilities, through: :park_facilities
  
    has_many :visitors
  has_many :wildlife
  validates_presence_of :name, :location, :established_date, :size

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location, against: [:name, :location]

end
