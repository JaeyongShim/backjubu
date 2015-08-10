class RatesController < ApplicationController
	before_action :login_check, :only => [:create, :update]
	after_action :post_rating, :only => [:create, :update]
	def create
		@post=Post.find(params[:post_id])
		@rate=@post.rates.new(rate_params)
		if @rate.save
			flash[:alert]="평가에 참여하셨습니다."
			redirect_to post_path(@post)
		else
			flash[:alert]=@comment.errors.values.flatten.join(' ')
			redirect_to post_path(@post)
		end
	end

	def update
		@rate=Rate.find(params[:id])
	if	@rate.update(rate_params)
			flash[:alert]="평가를 수정하였습니다."
			redirect_to :back 
		else
			flash[:alert]=@comment.errors.values.flatten.join(' ')
			redirect_to :back 
		end
	end


	private 
		def rate_params
			params.require(:rate).permit(:user_id,:rating)
		end


 	def post_rating
		@rate.post.update(rating:
	(@rate.post.rates.average(:rating)*10).to_i/10.0)
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
