class Api::V1::SongsController < ApplicationController

  def index
    @songs = Category.find(params[:category_id]).songs
    render json: @songs
  end

  def show
  end

  # category_idsの配列を受け取ってそのカテゴリに紐づくSONGを作る
  def create
    @song = Song.create(song_params)
    @song.update(category_ids: params[:category_ids])

    render json: @song
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    @song.update(category_ids: params[:category_ids])

    render json: @song
  end

  def destroy
    Song.find(params[:id]).destroy!
    render json: {message: '削除が完了しました'}, status: :ok
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end

end