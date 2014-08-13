class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if params[:comment][:body].length != 0
      @comment = @post.comments.create!(params[:comment].permit(:body))
      redirect_to @post
    else
      redirect_to @post
    end
  end

  def downvote
    @comment = Comment.find(params[:id])
    @comment.votes.create(upvote: false)
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  def upvote
    @comment = Comment.find(params[:id])
    @comment.votes.create(upvote: true)
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  def downvotes
    @comment = Comment.find(params[:id])
    @comment.votes.where(upvote: false)
  end

  def upvotes
    @comment = Comment.find(params[:id])
    @comment.votes.where(upvote: true)
  end
end