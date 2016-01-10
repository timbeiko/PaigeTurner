class TweetsController < ApplicationController
  protect_from_forgery except: :tweetout

	def new
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		@tweet.body = params[:tweet][:body]
		@tweet.book_id = params[:tweet][:book_id]
    if @tweet.save
    	redirect_to new_tweet_path
    else
    	@tweet = Tweet.new
    	render :action => :new
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
    tweet = current_user.books.first.tweets.find_by(id: current_user.tweets_index + 1).body
    increase_tweets_index(current_user)
    current_user.save!
    binding.pry
    @client.update(handle + " " + tweet)
    redirect_to bot_path
  end

	private
	def tweet_params
  	params.require(:tweet).permit(:body, :book_id)
	end

end