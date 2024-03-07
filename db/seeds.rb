require "faker"

Movie.destroy_all

10.times do
  Movie.create(
    title: Faker::Movie.title,
    overview: Faker::Lorem.paragraph(sentence_count: 3),
    poster_url: Faker::Internet.url,
    rating: Faker::Number.decimal(l_digits: 1, r_digits: 1)
  )
end
