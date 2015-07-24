class Comment < ActiveRecord::Base
	belong_to :user
	belong_to :post
	validates :content, :presence => {:message =>"내용을 입력하세요."}
end
