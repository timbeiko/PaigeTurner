class BooksController < ApplicationController
	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.title = params[:book][:title]
		@book.author = params[:book][:author]
    	if @book.save
    		redirect_to new_tweet_path
    	else
    		@book = Book.new
    		render :action => :new
    	end
	end

	private
	def book_params
  		params.require(:book).permit(:title, :author)
	end
end