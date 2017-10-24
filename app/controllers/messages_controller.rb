class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def new
    @message = Message.new
  end

  def create #
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to root_path, notice: 'Message was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy #
    @message.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Message was successfully destroyed.' }
    end
  end

  private

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:body, :description, :receiver_id, :sender_id)
    end
end
