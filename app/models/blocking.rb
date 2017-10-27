class Blocking < ActiveRecord::Base
  belongs_to :user
  belongs_to :blocked_user, class_name: 'User'

  validates :user_id, uniqueness: {
    scope: [:blocked_user_id],
    message: 'User already blocked.'
  }

  validate :only_different_user_and_blocked_user

  def only_different_user_and_blocked_user
    errors.add(:user,'is the same as Blocked user.') if user_id == blocked_user_id
  end
end
