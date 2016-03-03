module SessionsHelper
    
    def current_user
        @current_person = @current_person || Person.find_by(id: session[:person_id])
    end
    
    def logged_in?
        !!current_user
    end
    
    def store_location
        session[:forwarding_url] = request.url if request.get?
    end
    
end
