class DestroyMessage
  attr_reader :message_id

  def initialize(message_id)
    @message_id = message_id
  end

  def call
    message = Message.find(@message_id)
    message.destroy if message
  end
end