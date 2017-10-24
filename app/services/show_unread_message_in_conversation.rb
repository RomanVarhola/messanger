class ShowUnreadMessagesInConversation
  attr_reader :current_user, :conversation

  def initialize(current_user, conversation)
    @user = current_user
    @conversation = conversation
  end

  def call
    @conversation.messages.where(read: false).count
  end
end