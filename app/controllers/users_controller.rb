class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user!
  before_action :user_blocked!
  before_action :find_user, only: [:show, :edit, :update, :destroy, :block, :unblock]

  def index
    @users = User.all
  end

  def show
  end
  
  def edit
  end

  def new
    @user = User.new
  end

  def create
    begin
      factory = CreateUser.new(user_params)
      factory.call
      flash[:notice] = "User was successfully created."
    rescue Exception => e
      flash[:notice] = e.message
      redirect_to new_user_path
    end

    redirect_to user_path(@user)
  end

  def update
    begin
      factory = UpdateUser.new(@user, user_params)
      factory.call
      flash[:notice] = "User was successfully updated."
    rescue Exception => e
      flash[:notice] = e.message
    end

    redirect_to user_path(@user)
  end

  def destroy
    begin
      factory = DestroyUser.new(@user)
      factory.call
      flash[:notice] = "User was successfully destroyed."
    rescue Exception => e
      flash[:notice] = e.message
    end

    redirect_to users_path
  end

  def block
    begin
      factory = BlockUser.new(@user)
      factory.call
      flash[:notice] = "User was successfully blocked."
    rescue Exception => e
      flash[:notice] = e.message
    end

    redirect_to users_path
  end

  def unblock
    begin
      factory = UnblockUser.new(@user)
      factory.call
      flash[:notice] = "User was successfully unblocked."
    rescue Exception => e
      flash[:notice] = e.message
    end

    redirect_to users_path
  end

  private
    
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :city, :email)
  end
end
