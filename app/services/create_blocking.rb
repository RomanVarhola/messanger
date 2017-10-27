class CreateBlocking
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    @blocking = Blocking.new(@params)

    if @blocking.valid?
      blocking = Blocking.new(@params)
      blocking.save!
    else
      raise(NotValidEntryRecord, @blocking.errors.full_messages.to_sentence)
    end
  end
end