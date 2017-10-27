class ReplyMessage
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def call
    if @message
      message = Message.new(receiver_id: @message.receiver_id,
                            sender_id: @message.sender_id,
                            body: @message.body,
                            description: @message.description
                          )
    end
    if message.valid?
      message.save
    else
      raise(NotValidEntryRecord, message.errors.full_messages.to_sentence)
    end
  end
end