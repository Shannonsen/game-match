require 'json'

file_path = Rails.root.join('db', 'games.json')
games = JSON.parse(File.read(file_path))

selected_games = games.first(10)
cache_categories = []
cache_genres = []

begin
  selected_games.each_slice(5).each_with_index do |batch, index|
    puts "Processing batch of #{batch.size} videogames..."
    categories=[]
    genres=[]
    videogames_lote=[]
    videogame_categories_to_insert=[]
    videogame_genres_to_insert=[]
      ActiveRecord::Base.transaction do
        videogames_lote = batch.map do |app_id, game|
          { 
          name: game['name'], 
          description: game['short_description'], 
          publisher: 'a',
          price: game['price'],
          release_date: game['release_date'],
          created_at: Time.current, 
          updated_at: Time.current
          }
        end

        batch.flat_map do |app_id, game|
          game['categories'].uniq.map do |category_name|
            unless cache_categories.include?(category_name)
              cache_categories << category_name
              categories << {
                name: category_name,
                created_at: Time.current,
                updated_at: Time.current
              }
            end
          end
        end

        batch.flat_map do |app_id, game|
          game['genres'].uniq.map do |genre_name|
            unless cache_genres.include?(genre_name)
              cache_genres << genre_name
              genres << {
                name: genre_name,
                created_at: Time.current,
                updated_at: Time.current
              }
            end
          end
        end

        Videogame.insert_all(videogames_lote)
        Category.insert_all(categories)
        Genre.insert_all(genres)

        videogames_names = videogames_lote.map { |videogame| videogame[:name] }
        all_videogames = Videogame.where(name: videogames_names)
        all_categories = Category.where(name: cache_categories)
        all_genres = Genre.where(name: cache_genres)

        batch.each do |app_id, game|
          game['categories'].uniq.each do |category_name|
            category = all_categories.find_by(name: category_name)
            videogame = all_videogames.find_by(name: game['name'])
            videogame_categories_to_insert << {
              videogame_id: videogame.id,
              category_id: category.id,
              created_at: Time.current,
              updated_at: Time.current
            }
          end

          game['genres'].uniq.each do |genre_name|
            genre = all_genres.find_by(name: genre_name)
            videogame = all_videogames.find_by(name: game['name'])
            videogame_genres_to_insert << {
              videogame_id: videogame.id,
              genre_id: genre.id,
              created_at: Time.current,
              updated_at: Time.current
            }
          end
        end

        VideogameGenre.insert_all(videogame_genres_to_insert)
        VideogameCategory.insert_all(videogame_categories_to_insert)
      end
      puts "Batch #{index} processed successfully!"
  end
  puts "All videogames processed successfully!"
rescue StandardError => e
  puts "Error processing: #{e.message}"
end