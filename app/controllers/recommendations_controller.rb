class RecommendationsController < ApplicationController
  def new; end

  def create
    user_query = params[:user_query]

    chat_service = OpenaiChatService.new 
    chat_service.add_message('user',  "Suggest a videogame considering I've played it before '#{user_query}'")
    
    @response = "Your result was:  '#{chat_service.chat}'"
    render :new
  end

end
