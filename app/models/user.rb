class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :created_conversations, foreign_key: 'sender_id', class_name: 'Conversation'
  has_many :member_conversations, foreign_key: 'receiver_id', class_name: 'Conversation'
  has_many :received_conversations, foreign_key: 'recipient_id'
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'Message'
  has_many :received_messages, foreign_key: 'receiver_id', class_name: 'Message'
  
  before_validation :set_default_role 

  def full_name
    "#{first_name} #{last_name}"
  end

  private
  
  def set_default_role
  	self.role ||= 'user'
  end
end
