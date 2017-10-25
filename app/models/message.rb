class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :receiver, foreign_key: 'receiver_id', class_name: 'User'
  belongs_to :sender, foreign_key: 'sender_id', class_name: 'User'

  validates_presence_of :body, :description
  validate :only_different_sender_and_receiver

  after_create :create_or_update_conversation
  
  def only_different_sender_and_receiver
    errors.add(:receiver,'is the same as Sender.') if sender_id == receiver_id
  end 

  def create_or_update_conversation
    conversation = Conversation.find_by(receiver: receiver, sender: sender) || Conversation.find_by(receiver: sender, sender: receiver)
    conversation = Conversation.create(receiver: receiver, sender: sender) if conversation.nil?
    conversation.messages << self if conversation
  end
end
