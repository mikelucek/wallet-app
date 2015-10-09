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
		if !session[:id]
			flash[:notice] = "You need to sign in first"
			redirect_to signin_path
		end

		@card = Card.new(params.require(:card).permit(:cnumber, :xmonth, :xyear, :balance))
		if @card.save
			@relationship = UserCard.new(user_id: session[:id], card_id: @card.id)
			@relationship.save
			flash[:notice] = "card saved."
			redirect_to root_path
		else
			flash[:notice] = "error saving card. try again."
			render new_card_path
		end
		#make the card, and make an association on user_card as well
	end

	def edit
	end

	def update
	end

	def destroy
		#first kill the card
		@destruction = Card.where(id: params[:card_id]).first
		@destruction.destroy
		#then kill all the relationships
		@relationship_destruction = UserCard.where(card_id: params[:card_id])
		@relationship_destruction.each do |x|
			x.destroy
		end

		flash[:notice] = "card deleted"
		redirect_to root_path
	end



end
