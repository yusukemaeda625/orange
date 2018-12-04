class PagesController < ApplicationController

	def top
	end

	def signup		
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
	end

	def signin_check
		username = params[:username]
		password = params[:password]

		users = User.where("name = ? and password = ?",username ,password)
		user = users[0];

		if user
			session[:id] = user.id;
			redirect_to "/"
		else
			redirect_to "/user/signin"
		end
	end
end
