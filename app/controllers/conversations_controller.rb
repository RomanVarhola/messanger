class ConversationsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @conversation = Conversation.find(params[:id])
    
    respond_to { |format| format.js }
  end 
end
