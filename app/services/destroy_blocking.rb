class DestroyBlocking
  attr_reader :blocking_id

  def initialize(blocking_id)
    @blocking_id = blocking_id
  end

  def call
    blocking = Blocking.find(@blocking_id)
    blocking.destroy if blocking
  end
end