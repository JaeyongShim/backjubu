class UsersController < ApplicationController
  def signup
		@user=User.new
  end

  def signup_complete
		@user=User.new(params.require(:user).permit(:username,:password))
		if params[:user][:password]!=params[:user][:retype_password]
			flash[:alert]="비밀번호가 다릅니다"
			redirect_to :back
		elsif @user.save
			flash[:alert]="회원가입 되었습니다."
			redirect_to('/')
		else
			flash[:alert]=@user.errors.values.flatten.join(' ')
			redirect_to :back
		end
  end

  def login
		@user=User.new
  end

  def login_complete
		user=User.where(params[:user])[0]
		if user.nil?
			flash[:alert]="아이디 또는 비밀번호를 잘못 입력하셨습니다."
			redirect_to :back
		else
			session[:user_id]=user.id
			flash[:alert]="성공적으로 로그인하였습니다."
			redirect_to '/'
		end
  end

  def logout_complete
  end
end
