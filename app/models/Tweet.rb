class Tweet <ActiveRecord::Base
	belongs_to :book

	validates_length_of :body, :maximum => 102
end