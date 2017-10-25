class UpdateUser
  attr_reader :user, :params

  def initialize(user, params)
    @user = user
    @params = params
  end
  
  def call
    @user = User.find_by(id: @user.id)
    if @user.valid?
      @user.update(@params)
    end  
    unless @user.save
      binding.pry
      raise(NotValidEntryRecord, @user.errors.full_messages.to_sentence)
    end
  end
end