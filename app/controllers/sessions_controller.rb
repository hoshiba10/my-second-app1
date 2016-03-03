class SessionsController < ApplicationController
  def new
  end
  
  def create
    @person = Person.find_by(email: params[:session][:email].downcase)
    if @person && @person.authenticate(params[:session][:password])
      session[:person_id] = @person.id
      redirect_to @person
    else 
      render 'new'
    end
  end
  
  def destroy
    session[:person_id] = nil
    redirect_to root_path
  end
  
end
