class PostsController < ApplicationController
  def index
		@posts=Post.reverse.all
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
  end

  def new_complete
  end

  def edit
  end

  def edit_complete
  end

  def create
  end

  def update
  end

  def destroy
  end
end
