class Post < ActiveRecord::Base
	has_many :comments
	validates :category, :inclusion => { :in => ["한식","외국음식","간식","술"], :message =>"한식, 외국음식, 간식, 술 중 하나를 선택하셔야 합니다."}
	validates :title, :presence => {:message =>"제목을 입력하세요." }
	validates :content, :presence => {:message=>"내용을 입력하세요."}
end
