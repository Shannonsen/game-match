require 'json'

file_path = Rails.root.join('db', 'games.json')
games = JSON.parse(File.read(file_path))

selected_games = games.first(10)

selected_games.each do |app_id, game|
  categories = game['categories']
  genres = game['genres']
  videogame = Videogame.find_or_create_by(
  name: game['name'],
  description: game['short_description'],
  publisher: game['publishers'].first,
  price: game['price'],
  release_date: game['release_date'],
  )

  categories.each do |category_name|
    category = Category.find_or_create_by(name: category_name)
      VideogameCategory.find_or_create_by(videogame: videogame, category: category)
  end

  genres.each do |genre_name|
    genre = Genre.find_or_create_by(name: genre_name)
    VideogameGenre.find_or_create_by(videogame: videogame, genre: genre)
  end
end