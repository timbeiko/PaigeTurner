class User <ActiveRecord::Base
  validates_presence_of :uid, :provider, :handle
  has_many :user_books
  has_many :books, through: :user_books # Would need to change this to only allow 1 book

  def self.create_with_omniauth(auth)
    create! do |user|
      user.handle = "@" + auth["info"]["nickname"]
      user.image = auth["extra"]["raw_info"]["profile_image_url"] 
      user.uid = auth["uid"]
      user.token = auth["credentials"]["token"] # We might not even need this
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.tweets_index = 0
    end
  end

  def has_reached_max_tweets?
    self.tweets_index >= self.books.first.tweets.count
  end

  def reset_tweets_index
    self.tweets_index = 0
  end

  def increase_tweets_index
    self.tweets_index += 1
    self.save!
  end
end