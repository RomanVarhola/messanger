class CreateMessage
  attr_reader :current_user, :params

  def initialize(current_user, params)
    @user = current_user
    @params = params
  end

  def call
    @message = Message.new(@params)

    if @message.valid?
      message = Message.new(@params)
      message.save!
    else
      raise(NotValidEntryRecord, @message.errors.full_messages.to_sentence)
    end
  end
end