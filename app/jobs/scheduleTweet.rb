module ScheduleTweet
    @queue = :tweets
    def self.perform()
      User.all.each do |user|
        if ((user.books.count != 0) && (user.books.first.tweets.count != 0))
          @client = Twitter::REST::Client.new do |config|
            config.consumer_key        = ENV["TWITTER_API_KEY"]
            config.consumer_secret     = ENV["TWITTER_API_SECRET"]
            # Change this in prod
            config.access_token        = ENV["ACCESS_TOKEN"]
            config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
          end


          if user.has_reached_max_tweets?
            user.reset_tweets_index
          end

          handle = user.handle
          tweet = user.books.first.tweets[user.tweets_index].body
          user.increase_tweets_index
          response = @client.update(handle + " " + tweet)
          begin
            puts response.inspect
          rescue Exception => e
            # e.message contains the twitter response
            puts e.message
          end
        end
      end
  end
end
