class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :receiver, foreign_key: 'receiver_id', class_name: 'User'
  belongs_to :sender, foreign_key: 'sender_id', class_name: 'User'

  def other_member(current_user)
    if current_user == sender
      user = receiver
    else
      user = sender
    end
    user
  end

  def unread_message(current_user)
    ShowUnreadMessagesInConversation.new(current_user, self).call
  end

  def update_messages
    messages.each do |message|
      message.update_attribute(:read, true) if current_user == message.receiver
    end
  end
end
