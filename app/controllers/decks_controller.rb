class DecksController < ApplicationController
	before_filter :authenticate

	def index  
		#index action
		@decks = current_user.decks 
		#Retrieving the decks from the database
	end

	def show
		@deck = find_deck
		#retrieving the deck based on the id params coming from the url
		@cards = @deck.cards
		#grab the cards through the association
	end

	def new
		@deck = current_user.decks.new
	end

	def create
		@deck = current_user.decks.new(params[:deck].permit(:name)) 
		#choosing the params to be used and set to create a new deck, params coming from the form
		#and adding permission (strong parameters)
		@deck.save 
		#saving to the database
		redirect_to decks_path
	end

	def edit
		@deck = find_deck #id parameter comes from the url
	end

	def update
		@deck = find_deck #finding the deck
		@deck.update_attributes(params[:deck].permit(:name)) #updating the attributes and add permission
		redirect_to @deck #redirect to updated deck object (polymorphic)
	end

	def destroy
		@deck = find_deck
		@deck.destroy
		redirect_to decks_path
	end

	private

	def find_deck
		current_user.decks.find(params[:id])
	end

end