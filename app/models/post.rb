class Post < ActiveRecord::Base
	has_many :comments
	has_many :votes
  	validates_presence_of :body
  	LOCATIONS = ['The Block on 25th East & West', 
			    'The Block on 28th', 
			    'The Block on Leon', 
			    'The Block on 23rd', 
			    'The Block on Pearl North & South', 
			    'The Block on Rio Grande']


	def downvotes
		self.votes.where(upvote: false).count
	end

	def upvotes
		self.votes.where(upvote: true).count
	end
end
