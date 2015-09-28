class UsersController < ApplicationController
	def index
		#show all users, and show the card numbers usable by each
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:fname, :lname, :email, :password, :phone))
		if @user.save
			flash[:alert] = "created successfully"
			redirect_to root_path
		else
			flash[:alert] = "there was a problem creating this user."
			redirect_to new_user_path
		end
	end

	def update
	end

	def destroy
	end

end
