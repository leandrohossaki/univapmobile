class LoginController < ApplicationController
  layout "mp_login"
  
  skip_before_filter :authenticate, :only => [:login]
  
  def login
    if request.post?
      @student = Student.find_by_id_and_password(params[:id], params[:password])
      if @student
        session[:user] = @student.id
        if session[:return_to] && !session[:return_to].include?(url_for(:action => "login"))
          redirect_to session[:return_to]
          session[:return_to] = nil
        else
          redirect_to :controler => "home"
        end
      else
        flash[:notice] = "Invalid login and/or password."
      end
    end
  end

  def logout
    session[:user] = nil
  end
end
