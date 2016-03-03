class PeopleController < ApplicationController
  def new
    @person = Person.new
  end
  
  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to person_path(@person)
    else
      render 'new'
    end
  end
  
  def show
    logged_in_user
    if current_user
      @person = Person.find(params[:id])
    end
  end
  
  private
  def person_params
    params.require(:person).permit(:name, :email, :sex, :password, :password_confirmation)
  end
  
end
