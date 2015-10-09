class SessionsController < ApplicationController
	def create
		@user = User.where(email: params[:email]).first
		if @user.password == params[:password]
			session[:id] = @user.id
			flash[:notice] = "Success! Signed in as #{@user.fname}"
			redirect_to root_path
		else
			flash[:notice] = "Incorrect Sign-in. Try again."
			redirect_to signin_path
		end
	end

	def destroy
		session[:id] = nil
		flash[:notice] = "signed out"
		redirect_to root_path
	end

end
