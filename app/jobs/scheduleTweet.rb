module ScheduleTweet
    @queue = :tweets
    def self.perform(tweets)
        puts "Tweeted"
    end
end
