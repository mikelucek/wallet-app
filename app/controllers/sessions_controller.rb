class SessionsController < ApplicationController
	def create
		@user = User.where(email: params[:email]).first
		if @user.password == params[:password]
			session[:id] = @user.id
			redirect_to root_path
		else
			flash[:notice] = "Incorrect Sign-in. Try again."
			redirect_to signin_path
		end
	end

end
