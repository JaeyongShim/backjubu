class PostsController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "1131", only: [:destroy,:edit]
	before_action :login_check
	skip_before_action :login_check, :only => [:index,:show,:show_category,:destroy,:edit]
  def index
		@posts=Post.all
  end

  def show
		@post=Post.find(params[:id])
		@comments=@post.comments
		@current_user=User.where(id: session[:user_id])[0]
	
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
		@post=Post.find(params[:id])
  end

  def create
		@post=Post.new(post_params)
		if @post.save
			flash[:alert]="글이 작성되었습니다"
			redirect_to(@post)
		else
			flash[:alert]=@post.errors.values.flatten.join(' ')
			redirect_to :back
		end
  end

  def update
		@post=Post.find(params[:id])
		if  @post.update(post_params)
			flash[:alert]="수정되었습니다."
			redirect_to @post
		else
			flash[:alert]=@post.errors.values.flatten.join(' ')
			redirect_to :back
		end
  end

  def destroy
		@post=Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
  end

	private
		def post_params
			params.require(:post).permit(:title,:content,:category)
		end
	
	def login_check
		@current_user =nil
		if !session[:user_id].nil?
			@current_user=User.find(session[:user_id])
		else
			redirect_to "/users/login"
		end
	end
end
