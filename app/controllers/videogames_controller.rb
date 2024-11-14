class VideogamesController < ApplicationController

  def index
    @videogames = Videogame.all
  end

end