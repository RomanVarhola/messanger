class DestroyMessage
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def call
    @message.destroy if @message
  end
end