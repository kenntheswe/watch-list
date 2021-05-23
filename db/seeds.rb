require 'json'
require 'open-uri'

url = "https://api.themoviedb.org/3/movie/top_rated?api_key=c59b8f6fc25c34e955209e5e22e3aa7c"
link = URI.open(url).read
results = JSON.parse(link)
movies = results['results']

puts "Clearing db"
Movie.destroy_all

puts "Creating movies"
movies.each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: movie['poster_path'],
    rating: movie['vote_average']
  )
end

puts "Created #{Movie.count} movies!"
