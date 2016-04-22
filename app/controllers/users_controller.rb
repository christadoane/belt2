class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to '/songs'
    else
      @errors = @user.errors.full_messages
      flash[:errors] = @errors
  	  redirect_to '/users'
    end
  end
  def show
    @user = User.find(params[:id])
    @user_playlist = Playlist.where(user_id: params[:id]).group("song_id")
  end
  private
  def user_params
  	params.permit(:first_name, :last_name, :email, :password)
  end
end
