class CreateUser
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    @user = User.new(@params)

    if @user.valid?
      user = User.new(@params)
      user.save!
    else
      raise(NotValidEntryRecord, @user.errors.full_messages.to_sentence)
    end
  end
end