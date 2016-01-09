module ScheduleTweet
    @queue = :tweets
    def self.perform()
        puts "Tweeted"
    end
end
