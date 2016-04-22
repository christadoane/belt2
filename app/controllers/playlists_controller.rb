class PlaylistsController < ApplicationController
  def create
    @playlist = Playlist.new(user: User.find(params[:user_id]), song: Song.find(params[:song_id]))
  	if @playlist.save
  	  redirect_to '/songs'
  	else
  	  @errors = @playlist.errors.full_messages
  	  flash[:errors] = @errors
  	  redirect_to '/songs'
  	end
  end
end
