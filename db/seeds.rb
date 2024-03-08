require "dotenv/load"
require "json"
require "open-uri"

Movie.destroy_all

tmdb_api = ENV["TMDB_API_KEY"]
page_size = 10
url = "https://api.themoviedb.org/3/movie/popular?api_key=#{tmdb_api}&language=en-US&page=1&per_page=#{page_size}"

response = URI.open(url)
result = JSON.parse(response.read)

movies = result["results"]

movies.each do |movie_data|
  Movie.create(
    title: movie_data["title"],
    overview: movie_data["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{movie_data['poster_path']}",
    rating: movie_data["vote_average"]
  )
end
