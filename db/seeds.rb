# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = "http://tmdb.lewagon.com/movie/top_rated"
link = URI.open(url).read
movies = JSON.parse(link)
results = movies['results']

puts "Clearing db"
Movie.destroy_all

puts "Creating movies"
results.each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: movie['poster_path'],
    rating: movie['vote_average']
  )
end

puts "Created #{Movie.count} movies!"
