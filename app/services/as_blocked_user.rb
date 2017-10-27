class AsBlockedUser
  attr_accessor :options

  def initialize(args)
    @options = args
  end

  def current_user
    @current_user ||= options.fetch(:current_user, nil)
  end

  def blocked_users
    @blocked_users ||= Array(current_user&.blocked_users)
  end

  def as_blocked_users
    @as_blocked_users ||= Array(current_user&.as_blocked_users)
  end

  def blocking
    @blocking ||= begin
      user_ids = []
      as_blocked_users.each do |asbu|
        user_ids << asbu.user.id unless user_ids.include?(asbu.user.id)
      end
      user_ids
    end
  end
end