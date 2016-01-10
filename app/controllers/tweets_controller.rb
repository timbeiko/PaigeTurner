class TweetsController < ApplicationController
	autocomplete :book, :title

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

  def tweet
    redirect_to bot_path
  end

	private
	def tweet_params
  	params.require(:tweet).permit(:body, :book_id)
	end
end