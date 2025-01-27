class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    self.new
    @song.name = params[:song][:name]
    @song.artist_id = params[:song][:artist_id]
    @song.genre_id = params[:song][:genre_id]
    @song.save
    redirect_to song_path(@song.id)
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(params.require(:song).permit(:name, :artist_id, :genre_id))
    redirect_to song_path(@song.id)
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end
end
