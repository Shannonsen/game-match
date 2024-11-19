class Category < ApplicationRecord
  has_many :videogame_categories
  has_many :videogames, through: :videogame_categories
end