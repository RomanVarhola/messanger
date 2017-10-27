class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def read
    @conversation = Conversation.find(params[:id])
    update_messages

    flash[:notice] = 'You have read messages.'
    redirect_to root_path
  end

  private

  def update_messages
    @conversation.messages.each do |message|
      message.update_attribute(:read, true) if current_user == message.receiver
    end
  end 
end