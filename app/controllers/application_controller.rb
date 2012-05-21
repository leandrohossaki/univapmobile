class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate
  
  protected
  
  def authenticate
    if !session[:user]
      if mobile_device?
        if request.url.include? "mobile"
          session[:return_to] = request.url
        else
          session[:return_to] = url_for(:controller => :mobile)
        end
        redirect_to :controller => :mobile, :action => :login
      else
        session[:return_to] = request.url
        redirect_to :controller => :login, :action => :login
      end
    end
  end
  
  def mobile_device?
		request.user_agent =~ /Mobile|webOS|SymbOS|SymbianOS|Opera|Chrome/ #|Opera|SymbOS|SymbianOS|Android/
    #false
	end
end
