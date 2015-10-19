json.array!(@flash_message_states) do |flash_message_state|
  json.extract! flash_message_state, :id, :state
  json.url flash_message_state_url(flash_message_state, format: :json)
end
