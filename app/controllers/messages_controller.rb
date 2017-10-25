class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_blocked!
  before_action :set_message, only: [:destroy ,:reply]

  def new
    @message = Message.new
  end

  def create
    begin
      CreateMessage.new(current_user, message_params).call
      flash[:notice] = 'Message was successfully created.'
    rescue Exception => e
      flash[:notice] = e.message
    end

    redirect_to root_path
  end

  def destroy
    begin
      DestroyMessage.new(@message.id).call
      flash[:notice] = 'Message was successfully destroyed.'
    rescue Exception => e
      flash[:notice] = e.message
    end

    redirect_to root_path
  end

  def reply
    begin
      ReplyMessage.new(@message.id).call
      flash[:notice] = 'Message was successfully replied.'
    rescue Exception => e
      flash[:notice] = e.message
    end

    redirect_to root_path
  end

  private

    def set_message
      @message = Message.find_by(id: params[:id])
    end

    def message_params
      params.require(:message).permit(:body, :description, :receiver_id, :sender_id)
    end
end
