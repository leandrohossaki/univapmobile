class MobileController < ApplicationController
  layout "mp_mobile"
  
  skip_before_filter :authenticate, :only => [:login, :options2]
  
  def index
    @title = "Bem-Vindo!"
  end
  
  def discipline
    @discipline = Discipline.find_by_id(params[:discipline_id])
    @evaluation = Evaluation.find_discipline_id_and_student_id(params[:discipline_id], session[:user])
    @lacks = Lack.find_all_by_discipline_id_and_student_id(params[:discipline_id], session[:user])
    @title = @discipline.description
  end
  
  def discipline_pending
    @discipline = Discipline.find_by_id(params[:discipline_id])
    @title = @discipline.description
  end
  
  def disciplines_history
    @title = "Histórico"
    @evaluations = Evaluation.find_student_history_approved(session[:user])
  end
  
  def disciplines_now
    @title = "Boletim" 
    @evaluations = Evaluation.find_student_now(session[:user])
  end
  
  def disciplines_pending
    @title = "A cursar"
    @evaluations_reproved = Evaluation.find_student_history_repproved(session[:user])
    @disciplines_pending = Discipline.find_student_pending(session[:user])
  end
  
  def student
    @title = "Aluno"
  end
  
  def student_data
    @title = "Dados pessoais"
    @student = Student.find_by_id(session[:user])
  end
  
  def library
    @title = "Biblioteca"
  end
  
  def library_unit
    @title = "Unidades"
    @units = Unit.all(:order => "name")
  end
  
  def library_available
    @title = "Buscar"
    if(params[:id])
      @all = false
    else
      @all = true
    end
    @books = Book.find_available(params[:id])
  end
  
  def book
    @book = Book.find_by_id(params[:id])
    @title = @book.name
  end
  
  def library_leased
    @title = "Locados"
    @locations = Location.find_student_leased(session[:user])
  end
  
  def library_history
    @title = "Histórico"
    @locations = Location.find_student_history(session[:user])
  end
  
  def options
    @title = "Opções"
  end
  
  def options2
    @title = "Opções"
  end

  def login
    @title = "UNIVAP Mobile"
    if !session[:user]
      if request.post?
        @student = Student.find_by_id_and_password(params[:id], params[:password])
        if @student
          session[:user] = @student.id
          if session[:return_to] && !session[:return_to].include?(url_for(:action => "login")) && !session[:return_to].include?(url_for(:action => "logout"))
            redirect_to session[:return_to]
            session[:return_to] = nil
          else
            redirect_to :controler => :mobile, :action => :index
          end
        else
          flash[:notice] = "Invalid login and/or password."
        end
      end
    else
      redirect_to :action => :index
    end
  end
  
  def logout
    @title = "UNIVAP Mobile"
    session[:user] = nil
  end
end
