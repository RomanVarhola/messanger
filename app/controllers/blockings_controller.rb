class BlockingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blocking, only: [:destroy]

  def index
    @blockings = BlockingUser.new(current_user: current_user).blocked_users
  end

  def create
    begin
      CreateBlocking.new(blocking_params).call
      flash[:notice] = 'User was blocked.'
    rescue Exception => e
      flash[:notice] = e.message
    end

    redirect_to root_path
  end

  def destroy
    begin
      DestroyBlocking.new(@blocking).call
      flash[:notice] = 'User was unblocked.'
    rescue Exception => e
      flash[:notice] = e.message
    end

    redirect_to root_path
  end

  private
    
  def set_blocking
    @blocking = Blocking.find(params[:id])
  end

  def blocking_params
    params.require(:blocking).permit(:user_id,:blocked_user_id)
  end
end
