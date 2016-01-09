class Tweet <ActiveRecord::Base
	def tweet_params
  		params.permit( :body)
	end
end