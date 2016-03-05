class RelationshipsController < ApplicationController
    before_action :logged_in_user
    
    def create
        @person = Person.find(params[:followed_id])
        current_user.follow(@person)
    end
    
    def destroy
        @person = current_user.following_relationships.find(params[:id]).followed
        current_user.unfollow(@person)
    end
    
end
