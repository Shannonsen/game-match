class OpenaiChatService
  def initialize 
    @client = OpenAI::Client.new
    @messages = [
      { role: "system", content: "You're a professional gamer passionate about recommending games to others." }
    ]
  end

  def add_message(role, content)
    @messages << { role: role, content: content }
    print 'message add'
  end

  def chat
    response=""
    @client.chat(
      parameters: { 
        model: "gpt-3.5-turbo",
        messages: @messages,
        stream: proc do |chunk, _bytesize|
          content = chunk.dig("choices", 0, "delta", "content")
          response << content.to_s if content
        end
      }
    )

    response
  end

  def messages
    @messages
  end
end
