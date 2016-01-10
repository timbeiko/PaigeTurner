class ApplicationController < ActionController::Base
  protect_from_forgery except: :increase_tweets_index
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def increase_tweets_index(current_user)
    current_user.tweets_index += 1
    current_user.save!
  end
end
