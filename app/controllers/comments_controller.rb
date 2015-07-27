class CommentsController < ApplicationController

  def create
		@post=Post.find(params[:post_id])
		@comment=@post.comments.new(comment_params)
		if @comment.save
			flash[:alert]="댓글이 달렸습니다."
			redirect_to post_path(@post)
		else 
			flash[:alert]="내용을 써주세요"
			redirect_to post_path(@post)
		end
  end


  def destroy
		@comment=Comment.find(params[:id])
		@post=@comment.post
		@comment.destroy
		redirect_to post_path(@post)
  end
	private
		def comment_params
			params.require(:comment).permit(:content, :user_id)
		end

  def edit
  end

  def show
  end

  def update
  end

end
