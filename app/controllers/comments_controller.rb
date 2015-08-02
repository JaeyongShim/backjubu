class CommentsController < ApplicationController
	before_action :login_check, :only => [:create, :destroy]
  def create
		@post=Post.find(params[:post_id])
		@comment=@post.comments.new(comment_params)
		if @comment.save
			flash[:alert]="댓글이 달렸습니다."
			redirect_to post_path(@post)
		else 
			flash[:alert]=@comment.errors.values.flatten.join(' ')
			redirect_to post_path(@post)
		end
  end


  def destroy
		@comment=Comment.find(params[:id])
		@post=@comment.post
		if session[:user_id]==@comment.user_id
			@comment.destroy
			flash[:alert]="댓글이 삭제되었습니다."
			redirect_to post_path(@post)
		else 
			flash[:alert]="권한이 없습니다"
			redirect_to :back
		end
  end
	private
		def comment_params
			params.require(:comment).permit(:content, :user_id)
		end

  def edit
  end

  def update
  end

	def login_check
		@current_id=nil
		if !session[:user_id].nil?
			@current_id=session[:user_id]
		else
			redirect_to '/users/login'
		end
	end
end
