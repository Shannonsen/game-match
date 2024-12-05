class Videogame < ApplicationRecord
  has_many :videogame_categories
  has_many :categories, through: :videogame_categories

  has_many :videogame_genres
  has_many :genres, through: :videogame_genres
end