class Visitor < ApplicationRecord
  belongs_to :park
  validates_presence_of :year, :total_visitors, :camping_visitors
end
