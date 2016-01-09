class TweetsController < ApplicationController
	def new
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		@tweet.body = params[:tweet][:body]
    if @tweet.save
    	redirect_to new_tweet_path
    else
    	@tweet = Tweet.new
    	render :action => :new
    end
	end

	private
	def tweet_params
  	params.require(:tweet).permit(:body)
	end
end