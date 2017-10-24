module ApplicationHelper
  def admin_user!
    unless current_user.role == 'admin'
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'You are not admin ' }
      end
    end
  end
end