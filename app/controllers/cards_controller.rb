class CardsController < ApplicationController
	def index
		#show all cards, and show which users are associated with each
		@cards = Card.all
		@users = User.all
	end
	
	def new
		@card = Card.new
	end

	def create
		#make the card, and make an association on user_card as well
	end

	def edit
	end

	def update
	end

	def destroy
	end

	def share
		#make an association on the join table
	end

end
