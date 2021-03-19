module UserHelper
  def user_signed_in?
    session[:id] ? true : false
  end

  def current_user
    User.find(session[:id])
  end
end
