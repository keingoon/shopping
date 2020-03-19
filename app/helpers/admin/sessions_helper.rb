module Admin::SessionsHelper
  def current_admin
    if (admin_id = session[:administrator_id])
      @current_admin = Administrator.find_by(id: admin_id)
    end
  end

  def admin_log_in(administrator)
    session[:administrator_id] = administrator.id
  end

  def admin_logged_in?
    !current_admin.nil?
  end

  def logout
    session.delete(:administrator_id)
    current_admin = nil
  end
end
