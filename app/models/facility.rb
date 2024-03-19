class Facility < ApplicationRecord
    has_many :park_facilities
  has_many :parks, through: :park_facilities
  validates_presence_of :name, :description
end
