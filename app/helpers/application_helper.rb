module ApplicationHelper
  def admin_user!
    unless current_user.admin?
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'You are not admin ' }
      end
    end
  end

  def unread_messages
    ShowUnreadMessages.new(current_user).call
  end

  def show_active(i)
    'in active' if i == 0
  end

  def find_blocking(current_user, blocked_user)
    Blocking.find_by(user_id: current_user.id, blocked_user_id: blocked_user.id)
  end
end