class VideogamesController < ApplicationController

  def index
    @videogames = Videogame.paginate(page: params[:page], per_page: 5)
  end

end