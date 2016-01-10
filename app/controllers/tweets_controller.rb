class TweetsController < ApplicationController

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

    @client.update("Hello again!") # This is just for testing

    handle = current_user.handle
    # We'll need the actual logic to look somehting like this
    tweet = current_user.books.first.tweets.find_by(1).body
    # In order to select a tweet we'll need to -> See README.md
    @client.update(handle + " " + tweet)
    redirect_to bot_path
  end

	private
	def tweet_params
  	params.require(:tweet).permit(:body, :book_id)
	end
end