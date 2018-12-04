Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get "/", to: "pages#top"

	get "/user/signup", to: "pages#signup"

	post"/user/signup", to: "pages#signup_user"

	get "/user/signin", to: "pages#signin"

	post"/user/signin", to:"pages#signin_check"

end
