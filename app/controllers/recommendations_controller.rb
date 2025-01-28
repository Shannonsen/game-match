class RecommendationsController < ApplicationController
  def new; end

  def create
    user_query = params[:user_query]

    chat_service = OpenaiChatService.new 
    chat_service.add_message('user',  "Suggest an animation movie based on '#{user_query}'")
    chat_service.chat
    
    @response = "Recomendación basada en '#{user_query}'"  # Este es un ejemplo
    render :show
  end

  def show
    @response
  end
end
