class SongsController < ApplicationController
  def index
    @songs = Song.all 
  end
  def create
  	@song = Song.new(title: params[:title], artist: params[:artist], user_id: params[:user_id])
  	if @song.save
  	  redirect_to '/songs'
  	else
  	  @errors = @song.errors.full_messages
  	  flash[:errors] = @errors
      redirect_to '/songs'
  	end
  end
  def show
  	@song = Song.find(params[:id])
  	@playlist = Playlist.where(song_id: params[:id])
  end
end
