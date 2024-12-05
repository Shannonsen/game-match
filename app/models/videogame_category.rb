class VideogameCategory < ApplicationRecord
  belongs_to :videogame
  belongs_to :category
end
