class DestroyUser
  attr_reader :user_id

  def initialize(user_id)
    @user_id = user_id
  end

  def call
    user = User.find(@user_id)
    user.destroy if user
  end
end