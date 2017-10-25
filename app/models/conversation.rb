class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :receiver, foreign_key: 'receiver_id', class_name: 'User'
  belongs_to :sender, foreign_key: 'sender_id', class_name: 'User'

  def other_member(current_user)
    if current_user == sender
      full_name = receiver.full_name
    else
      full_name = sender.full_name
    end
    full_name
  end

  def other_receiver(current_user)
    if current_user == sender
      id = receiver.id
    else
      id = sender.id
    end
    id
  end

  def unread_messages(current_user)
    ShowUnreadMessagesInConversation.new(current_user, self).call
  end
end
