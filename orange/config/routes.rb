Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get "/", to: "pages#top"

	get "/user/signup", to: "pages#signup"

	post"/user/signup", to: "pages#signup_user"

	get "/user/signin", to: "pages#signin"

	post"/user/signin", to:"pages#signin_check"

	get "/user/mypage", to:"pages#mypage"
	
	get "/user/events", to:"pages#events"

	get "signout", to:"pages#signout"

	get "/admin", to:"pages#admin"

	get "/user/obog", to:"pages#obog"

	get "delete_attributes/:id", to:"pages#delete_attributes"
	
	get "participate/:id", to:"pages#participate"	
	
	get "participate_cancel/:id", to:"pages#participate_cancel"	

	post "create_attributes", to:"pages#create_attributes"

	post "add_attributes", to:"pages#add_attributes"
	
	post "create_events", to:"pages#create_events"	

end
