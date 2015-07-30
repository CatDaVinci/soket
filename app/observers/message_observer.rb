class MessageObserver < ActiveRecord::Observer
  def after_create(message)
    WebsocketRails['chat'].trigger 'message.new', MessageSerializer.new(message).to_json
  end
end