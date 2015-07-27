class PostsController < ApplicationController
  def index
		@posts=Post.all
  end

  def show
		@post=Post.find(params[:id])
  end

  def show_category
		case params[:category]
		when "korean"
			@category="한식"
		when "liquid"
			@category="술"
		when "snack"
			@category="간식"
		else
			@category="외국음식"
		end
		@posts=Post.where(category:@category)
  end

  def new
		@post=Post.new
  end

  def edit
  end

  def edit_complete
  end

  def create
		@post=Post.new(params.require(:post).permit(:title,:content,:category))
		if @post.save
			flash[:alert]="글이 작성되었습니다"
			redirect_to(@post)
		else
			flash[:alert]=@post.errors.values.flatten.join(' ')
			redirect_to :back
		end
  end

  def update
  end

  def destroy
  end
end
