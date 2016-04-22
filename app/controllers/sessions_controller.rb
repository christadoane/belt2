class SessionsController < ApplicationController
  def index
  end

  def new
    #session.clear
  end
  def create
  	user = User.find_by_email(params[:email])
		unless user
      flash[:errors] = ["Invalid Credentials"]
      redirect_to '/users'
    else
      if user.authenticate(params[:password])
			session[:id] = user.id
			redirect_to '/songs'
		  else
			flash[:errors] = ["Invalid password"]
      redirect_to '/users'
      end
		end
  end
  def destroy
    session[:id] = nil
    redirect_to '/users'
  end
end