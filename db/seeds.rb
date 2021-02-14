# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  Car.create! name: Faker::Vehicle.unique.make, max_speed: rand(200..600)
end

[
  { name: 'nurburgring', surface_type: 0},
  { name: 'sydney motorsport park', surface_type: 1},
  { name: 'guia circuit', surface_type: 2}
].each do |track_attributes|
  Track.create!(track_attributes)
end