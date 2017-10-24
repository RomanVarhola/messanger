class Conversation < ActiveRecord::Base
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
end
