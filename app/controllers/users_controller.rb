class UsersController < ApplicationController
	def index
		#show all users, and show the card numbers usable by each
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:fname, :lname, :email, :password, :phone))
		if @user.save
			session[:id] = @user.id
			flash[:alert] = "created successfully"
			redirect_to root_path
		else
			flash[:alert] = "there was a problem creating this user."
			render new_user_path
		end
	end

	def edit
		if !session[:id]
			flash[:notice] = "You need to sign in first"
			redirect_to signin_path
		end 
		@user = User.find(session[:id])
	end


	def update
		@user = User.find(params[:id])

		if @user.update(params.require(:user).permit(:fname, :lname, :email, :password, :phone))
			flash[:notice] = "Info Updated"
			redirect_to root_path
		else
			flash[:notice] = "There was a problem updating"
			render edit_user_path @user
		end
	end

	def destroy

	end

end
