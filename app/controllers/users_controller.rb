class UsersController < ApplicationController
  def show
    if good_profile?
      @user = current_user
    else
      redirect_to user_path(current_user.id)
    end

  end

  def bot
  end

  def tweetout
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"] 
      config.consumer_secret     = ENV["TWITTER_API_SECRET"] 
      config.access_token        = '4757590114-Kok6YXQBEENVeCKJv3WScIaOjNgS599fHPDoCoS'
      config.access_token_secret = 'gi8mWVzBJWCkElZm7vwR6423iXbwID2rLDmRklPQupgC0'
    end

    if current_user.has_reached_max_tweets?
      current_user.reset_tweets_index
    end

    handle = current_user.handle
    tweet = current_user.books.first.tweets[current_user.tweets_index].body
    current_user.increase_tweets_index
    @client.update(handle + " " + tweet)
    redirect_to bot_path
  end

  private 
  def good_profile?
    current_user.id.to_s == params["id"]
  end

  def user_params
    params.require(:user).permit(:tweets_index)
  end
end