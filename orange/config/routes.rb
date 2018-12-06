Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get "/", to: "pages#top"

	get "/user/signup", to: "pages#signup"

	post"/user/signup", to: "pages#signup_user"

	get "/user/signin", to: "pages#signin"

	post"/user/signin", to:"pages#signin_check"

	get "/user/mypage/:id", to:"pages#mypage"

	get "signout", to:"pages#signout"

	post "create_attributes", to:"pages#create_attributes"

	post "add_lagerattributes", to:"pages#add_lagerattributes"

	post "add_smallerattributes", to:"pages#add_smallerattributes"
end
