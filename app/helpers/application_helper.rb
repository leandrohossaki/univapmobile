module ApplicationHelper
  def session_user
    if session[:user]
      @session_user ||= Student.find(:first, :conditions => ['id = ?', session[:user]])
    end
  end
end
