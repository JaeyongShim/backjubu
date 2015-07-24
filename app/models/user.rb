class User < ActiveRecord::Base
	has_man :comments
	validates :username, :presence => {:message =>"아이디를 입력하세요"}
	validates :username, :uniqueness => {:message =>"이미 존재하는 아이디입니다.", :case_sensitive => false}
	validates :password, :length => { :minimum => 6, :too_showrt => "비밀번호는 최소 6자 이상입니다."}
end
