class TopPagesController < ApplicationController
  def index
    @tweet = current_user.tweets.build if logged_in?
    @timelines = current_user.timelines.includes(:person).order(created_at: :desc) if logged_in?
  end
end
