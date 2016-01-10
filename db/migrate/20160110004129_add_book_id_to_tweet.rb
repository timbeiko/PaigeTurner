class AddBookIdToTweet < ActiveRecord::Migration
  def change
  	change_table :tweets do |t|
  		t.integer :book_id
  	end
  end
end
