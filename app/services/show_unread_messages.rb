class ShowUnreadMessages
  attr_reader :current_user

  def initialize(current_user)
    @user = current_user
  end

  def call
    Message.where(receiver_id: @user.id, read: false).count
  end
end