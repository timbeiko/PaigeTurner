class Book <ActiveRecord::Base
  has_many :tweets
  has_many :user_books
  has_many :users, through: :user_books
end