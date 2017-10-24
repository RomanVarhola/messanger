class ConversationsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @conversation = Conversation.find(params[:id])
    update_messages
    
    respond_to { |format| format.js }
  end

  private

  def update_messages
    @conversation.messages.each do |message|
      message.update_attribute(:read, true) if current_user == message.receiver
    end
  end 
end
