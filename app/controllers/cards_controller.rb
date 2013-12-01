class CardsController < ApplicationController
	before_filter :authenticate
	def show
		@deck = find_deck
		#find the deck first based on the id params
		@card = find_card(@deck)
		#grab the deck through the association
	end


	def new
		@deck = find_deck
		@card = @deck.cards.new
	end

	def create
		@deck = find_deck
		@card = @deck.cards.new(params[:card].permit(:front, :back))
		@card.save
		redirect_to @deck
	end

	def edit
		@deck = find_deck
		@card = find_card(@deck)
	end

	def update
		@deck = find_deck
		@card = find_card(@deck)
		@card.update_attributes(params[:card].permit(:front, :back))
		redirect_to @deck
	end

	def destroy
		@deck = find_deck
		@card = find_card(@deck)
		@card.destroy
		redirect_to @deck
	end


	private

	def find_deck
		current_user.decks.find(params[:deck_id])
	end

	def find_card deck
		deck.cards.find(params[:id])
	end
end