module AuthenticationHelper
  def sign_in(admin)
    session[:admin_id] = admin.is_a?(Admin) ? admin.id : admin
  end

  def sign_out
    session[:admin_id] = nil
  end
end
