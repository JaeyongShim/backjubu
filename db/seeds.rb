# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = ["한식","외국음식","간식","술"]

0.upto(3) do |j|
	u=User.create(username:"#{j}"*3,password:"#{j}"*3)
end

categories.each do |category|
	0.upto(1) do |i|
		p=Post.create(title:"#{category}중 #{i} 이름",content:"#{category}집#{i} 설명",category:category)
		c=Comment.create(post_id:p.id, content:"#{i}가 쓴 코멘트",user_id:i+2)
	end
end


0.upto(1) do |k|
end
