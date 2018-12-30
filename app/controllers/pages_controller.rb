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
		phone = params[:phone]
		email = params[:email]

		user = User.new
 		user.name = username
		user.password = password
		user.guraduate = graduate
		user.schoolname = schoolname
		user.email = email
		user.phone = phone
		if user.save
			redirect_to "/user/signin"
		else
			render action: :signup
		end
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
	
	def edit_profile
		@user = User.find(session[:id])
	end

	def update_profile
		username = params[:username]
		password = params[:password]
		graduate = params[:graduate]
		schoolname = params[:schoolname]
		phone = params[:phone]
		email = params[:email]
		profile = params[:profile]

		user = User.find(session[:id])
		password = user.password
 		user.name = username
		user.password = password
		user.guraduate = graduate
		user.schoolname = schoolname
		user.email = email
		user.phone = phone
		user.profile = profile
		user.password = password
		user.save

		redirect_to "/user/signin"
	end

	def mypage
		if session[:id]
			@user = User.find(session[:id])
			@attributes = Attribute.all
			@eusers = Euser.where(name: session[:id])
			
		else
			redirect_to "/user/signin"
		end
	end
	
	def participate
		event = Event.find(params[:id])
		exists = Euser.where("name = ? and event_id = ?",session[:id] ,params[:id] )
		exist = exists[0];		
	
		if !exist
		
		euser = Euser.new
		euser.name = session[:id]
		euser.event = event
		euser.save
		
		end
		
		redirect_to "/user/events"
	end
	
	def participate_cancel
		event = Event.find(params[:id])
		exists = Euser.where("name = ? and event_id = ?",session[:id] ,params[:id] )
		exist = exists[0];		
	
		if exist
			exist.destroy
		end
		redirect_to "/user/events"
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
		number = params[:number]
		attribute = params[:eattribute][:name]
		place = params[:place]
		fee = params[:fee]
		edate = Time.new(params[:period_to][:year],params[:period_to][:month],params[:period_to][:day],params[:period_to][:hour],params[:period_to][:minute])
		
		event = Event.new
		event.name = name
		event.content = content
		event.date = edate
		event.number = number
		event.schoolname = user.schoolname
		event.place = place
		event.fee = fee
		event.ownerid = session[:id]
		
		if event.save
			eattribute = Eattribute.new
			eattribute.name = attribute
			eattribute.event = event
			eattribute.save

			evowner = Evowner.new
			evowner.name = user.name
			evowner.phone = user.phone
			evowner.email = user.email
			evowner.event = event
			evowner.save
		end	
		redirect_to "/user/mypage"
	end

	def admin
	end
end
