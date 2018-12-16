class PagesController < ApplicationController

	def top
	end

	def signup
		if session[:id]
			redirect_to "/user/mypage"
		end
	end

	def signup_user
		username = params[:username]
		password = params[:password]
		graduate = params[:graduate]
		schoolname = params[:schoolname]

		user = User.new
 		user.name = username
		user.password = password
		user.guraduate = graduate
		user.schoolname = schoolname
		user.save

		redirect_to "/user/signin"
	end

	def signin
		if session[:id]
			redirect_to "/user/mypage"
		end
	end

	def signout
		session[:id] = nil;
		redirect_to "/"
	end

	def signin_check
		username = params[:username]
		password = params[:password]

		users = User.where("name = ? and password = ?",username ,password)
		user = users[0];

		if user
			session[:id] = user.id;
			redirect_to "/user/mypage"
		else
			redirect_to "/user/signin"
		end
	end

	def mypage
		if session[:id]
			@user = User.find(session[:id])
			@attributes = Attribute.all
		else
			redirect_to "/user/signin"
		end
	end

	def events
		if session[:id]
			@user = User.find(session[:id])
			@events = Event.where(schoolname: @user.schoolname)
		else
			redirect_to "/user/signin"		
		end
	end

	
	def add_attributes
		name = params[:attribute][:name]
		user = User.find(session[:id])

		exists = Uattribute.where("name = ? and user_id = ?",name ,user.id )
		exist = exists[0];

		if !exist

		uattribute = Uattribute.new
		uattribute.name = name

		uattribute.user = user

		uattribute.save

		end

		id = session[:id];
		redirect_to "/user/mypage"
	end

	def obog
		if session[:id]
			@user = User.find(session[:id])
			@users = User.where(schoolname: @user.schoolname)
		else
			redirect_to "/user/signin"
		end
	end

	def create_attributes
		l_category = params[:l_category]

		attribute = Attribute.new
		attribute.name = l_category

		attribute.save

		redirect_to "/admin"
	end

	def delete_attributes
		user = User.find(session[:id])
		exists = Uattribute.where("id = ? and user_id = ?",params[:id] ,user.id )
		exist = exists[0];

		if exist
			exist.destroy
		end
		redirect_to "/user/mypage"
	end
	
	def create_events
		user = User.find(session[:id])
		name = params[:name]
		content = params[:content]
		date = params[:event][:start_at]
		number = params[:number]
		attribute = params[:eattribute][:name]
		
		event = Event.new
		event.name = name
		event.content = content
		event.date = date
		event.number = number
		event.schoolname = user.schoolname
		event.save
		
		eattribute = Eattribute.new
		eattribute.name = attribute
		eattribute.event = event		
		eattribute.save

		redirect_to "/user/mypage"
	end

	def admin
	end
end
