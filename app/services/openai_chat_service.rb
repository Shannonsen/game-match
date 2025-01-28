class OpenaiChatService
  def initialize 
    @client = OpenAI::Client.new
    @messages = []
  end

  def add_message(role, content)
    @messages << { role: role, content: content }
    print 'message add'
  end

  def chat
    @client.chat(
      parameters: { 
        model: "gpt-3.5-turbo",
        messages: @messages,
        stream: proc do |chunk, _bytesize|
          print chunk.dig("choices", 0, "delta", "content")
        end
      }
    ) 
  end

  def messages
    @messages
  end
end
