class ShowUnreadMessagesInConversation
  attr_reader :current_user_id, :conversation_id

  def initialize(current_user_id, conversation_id)
    @user_id = current_user_id
    @conversation_id = conversation_id
  end

  def call
    user = User.find(@user_id)
    conversation = Conversation.find(@conversation_id)

    conversation.messages.where(receiver_id: user.id, read: false).count
  end
end