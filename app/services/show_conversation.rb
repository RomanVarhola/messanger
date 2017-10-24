class ShowConversation
  attr_reader :current_user

  def initialize(current_user)
    @user = current_user
  end

  def call
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", @user.id, @user.id)
    @conversations = @conversations.select{ |conversation| conversation if conversation.messages.present? }
  end
end