class Wildlife < ApplicationRecord
  belongs_to :park
  validates_presence_of :species_name, :habitat, :population_status
end
