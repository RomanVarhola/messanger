class BlockUser
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def call
    @user.update_attributes(blocked: true)

    if @user.valid?
      @user.save!
    else
      raise(NotValidEntryRecord, @user.errors.full_messages.to_sentence)
    end
  end
end