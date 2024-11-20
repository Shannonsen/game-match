class RecommendationsController < ApplicationController
  def new; end

  def create
    user_query = params[:user_query]
    @response = "Recomendación basada en '#{user_query}'"  # Este es un ejemplo
    render :show
  end

  def show
    @response
  end
end
