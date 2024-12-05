class CreateVideogameGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :videogame_genres do |t|
      t.references :videogame, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
