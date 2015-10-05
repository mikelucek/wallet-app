class RelationshipsController < ApplicationController
	def show
		#share with people in @subset
		#unshare with people in @unshare
		@card = Card.find(params[:id])
		@users = User.all
		@subset = @users - @card.users.all
		@unshare = @card.users.all
	end

	def create
		@relationship = UserCard.new(user_id: params[:user_id], card_id: params[:card_id])
		@relationship.save
		redirect_to root_path
	end

	def destroy
		#unshare
		puts "TEST"
		puts @relationship = UserCard.where(user_id: params[:user_id], card_id: params[:card_id]).first
		# @relationship.destroy
		redirect_to root_path
	end


end
