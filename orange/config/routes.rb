Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get "/", to: "pages#top"

	get "/user/signup", to: "pages#signup"

	post"/user/signup", to: "pages#signup_user"

	get "/user/signin", to: "pages#signin"

	post"/user/signin", to:"pages#signin_check"

	get "/user/mypage/:id", to:"pages#mypage"

	get "signout", to:"pages#signout"
	
	get "/admin", to:"pages#admin"
	
	get "delete_attributes/:id", to:"pages#delete_attributes"
	
	post "create_attributes", to:"pages#create_attributes"

	post "add_attributes", to:"pages#add_attributes"

end
