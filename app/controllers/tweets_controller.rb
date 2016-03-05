class TweetsController < ApplicationController
    
    def create
        logged_in_user
        @tweet = current_user.tweets.build(tweet_params)
        if @tweet.save
            redirect_to root_url
        else
            @timelines = current_user.timelines.includes(:person).order(created_at: :desc)
            render 'top_pages/index'
        end
    end

    def destroy
        @tweet = current_user.tweets.find_by(id: params[:id])
        return redirect_to root_url if @tweet.nil?
        @tweet.destroy
        redirect_to request.referrer || root_url
    end
    
    private 
    def tweet_params
        params.require(:tweet).permit(:content)
    end
    
end
