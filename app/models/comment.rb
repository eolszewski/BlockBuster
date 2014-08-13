class Comment < ActiveRecord::Base
  	belongs_to :post
  	has_many :votes
  	validates_presence_of :body
  	
	def downvotes
		self.votes.where(upvote: false).count
	end

	def upvotes
		self.votes.where(upvote: true).count
	end
end
