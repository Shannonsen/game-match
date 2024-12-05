class Genre < ApplicationRecord
  has_many :videogame_genres
  has_many :videogames, through: :videogame_genres
end