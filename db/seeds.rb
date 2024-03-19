# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'


# Faker data for Parks
100.times do
  Park.create(
    name: Faker::Address.unique.community,
    location: Faker::Address.state,
    established_date: Faker::Date.between(from: 200.years.ago, to: Date.today),
    size: Faker::Number.within(range: 100..100000),
    description: Faker::Lorem.paragraph
  )
end


200.times do
  Visitor.create(
    park_id: Park.all.sample.id,
    year: Faker::Number.between(from: 2010, to: 2020),
    total_visitors: Faker::Number.between(from: 1, to: 100000),
    camping_visitors: Faker::Number.between(from: 0, to: 5000)
  )
end


# seeds.rb
population_statuses = ['Endangered', 'Vulnerable', 'Least Concern', 'Critically Endangered', 'Near Threatened', 'Data Deficient']

200.times do
  Wildlife.create(
    park_id: Park.all.sample.id,
    species_name: Faker::Creature::Animal.name,
    habitat: Faker::Address.unique.country, # Using Faker::Address as an example for habitat
    population_status: population_statuses.sample
  )
end


facilities = %w[Visitor_Center Picnic_Area Playground Trails]

park_ids = Park.pluck(:id)
facility_ids = Facility.pluck(:id)

unless park_ids.empty? || facility_ids.empty?
  random_park_id = park_ids.sample
  random_facility_id = facility_ids.sample

  park = Park.find(random_park_id)
  facility = Facility.find(random_facility_id)

  ParkFacility.find_or_create_by(park: park, facility: facility)
end


