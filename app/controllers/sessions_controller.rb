class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]

  def new
  	if current_user
  		redirect_to campaigns_path
  	end
  end

  def create
  	email = params[:session][:email]
  	password = params[:session][:password]

  	@user = User.find_by_email(email)
  	if @user && @user.authenticate(password)
  		login(@user)
  	else
  		redirect_to login_path, flash: { error: "Email o Password incorrecto"}
  	end
  end

  def destroy
  	logout
  end
end
