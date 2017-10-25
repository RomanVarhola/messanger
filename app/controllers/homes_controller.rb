class HomesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_blocked!

  def index
    @conversations = ShowConversation.new(current_user).call
    @message = Message.new
  end
end
