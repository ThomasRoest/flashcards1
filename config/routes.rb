Flashcards1::Application.routes.draw do
	root to: "homes#index"
	resource :session,only: [:new, :create, :destroy]
	#session is a singular resource
	resources :users, only: [:new, :create]
	resources :decks do
		resources :cards, except: :index
	end
end
