require 'json'

file_path = Rails.root.join('db', 'games.json')
games = JSON.parse(File.read(file_path))

selected_games = games.first(1500)

selected_games.in_groups_of(500, false) do |batch|
  puts "Processing batch of #{batch.size} videogames..."
  ActiveRecord::Base.transaction do
    batch.each do |app_id, game|
      videogame = Videogame.find_or_create_by(name: game['name']) do |vg|
        vg.description = game['short_description']
        vg.publisher = game['publishers'].first
        vg.price = game['price']
        vg.release_date = game['release_date']
      end

      game['categories'].uniq.each do |category_name|
        category = Category.find_or_create_by(name: category_name)
        VideogameCategory.find_or_create_by(videogame: videogame, category: category)
      end

      game['genres'].uniq.each do |genre_name|
        genre = Genre.find_or_create_by(name: genre_name)
        VideogameGenre.find_or_create_by(videogame: videogame, genre: genre)
      end
    end
  end
end

puts "Seed completed successfully."
