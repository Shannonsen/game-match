OpenAI.configure do |config|
  config.access_token = ENV["OPENAI_ACCESS_TOKEN"]
  config.log_errors = true
end
