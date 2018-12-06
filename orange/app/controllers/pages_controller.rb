class PagesController < ApplicationController

	def top
		if session[:id]
		@user = User.find(session[:id])
		end
	end

	def signup
		if session[:id]
			id = session[:id];
			redirect_to "/user/mypage/#{id}"
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
			id = session[:id];
			redirect_to "/user/mypage/#{id}"
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
			redirect_to "/user/mypage/#{user.id}"
		else
			redirect_to "/user/signin"
		end
	end

	def mypage
		@user = User.find(session[:id])
		@l_attributes = L_attribute.all
	end

	def add_lagerattributes
		@user = User.find(session[:id])
		@u_attribute = @user.u_attributes

	end

	def create_attributes
		lagercategory = params[:lagercategory]
		smallercategory = params[:smallercategory]

		attributes = Atribute.new
		attribute.lagercategory = lagercategory
		attribute.smallercategory = smallercategory
		attribute.save

		id = session[:id];
		redirect_to "/user/mypage/#{id}"
	end
end
