class ApplicationController < ActionController::Base
  protect_from_forgery

  def landing_page
    if current_user
      @timeline = current_user.timeline
      @friends = current_user.friends
      #@friends_tweets = current_user.friends_tweets
      @mentions = current_user.mentions
    end
  end

  def post_to_twitter
    current_user.twitter.update("Tweetie2 from Twweeter.")
    redirect_to "/"
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end

