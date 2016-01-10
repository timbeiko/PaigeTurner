class TweetsController < ApplicationController
  protect_from_forgery except: :tweetout

	def index
		@all_books = Book.all 
	end

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

	private
	def tweet_params
  	params.require(:tweet).permit(:body, :book_id)
	end

end