class ReplyMessage
  attr_reader :message_id

  def initialize(message_id)
    @message_id = message_id
  end

  def call
    message = Message.find(@message_id)

    message = Message.new(receiver_id: message.receiver_id,
                          sender_id: message.sender_id,
                          body: message.body,
                          description: message.description
                        )
    if message.valid?
      message.save
    else
      raise(NotValidEntryRecord, message.errors.full_messages.to_sentence)
    end
  end
end