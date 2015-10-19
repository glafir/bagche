json.array!(@flash_messages) do |flash_message|
  json.extract! flash_message, :id, :user_id, :message
  json.url flash_message_url(flash_message, format: :json)
end
