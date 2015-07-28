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
  end

  def login_complete
  end

  def logout_complete
  end
end
