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
      @tweets = @person.tweets.order(created_at: :desc)
    end
  end
  
  def edit
    logged_in_user
    @person = Person.find(params[:id])
    if @person == current_user
      render 'edit'
    else
      render 'show'
    end
  end
  
  def update
    logged_in_user
    @person = Person.find(params[:id])
    if @person == current_user
      if @person.update(person_params)
        redirect_to @person
      else
        render 'edit'
      end
    end
  end
  
  def followings
    logged_in_user
    @person = Person.find(params[:id])
    @followings = @person.following_people
  end
  
  def followers
    logged_in_user
    @person = Person.find(params[:id])
    @followers = @person.follower_people
  end
  
  private
  def person_params
    params.require(:person).permit(:name, :email, :sex, :password, :password_confirmation)
  end
  
end
