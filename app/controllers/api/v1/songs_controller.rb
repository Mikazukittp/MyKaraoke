class Api::V1::SongsController < ApplicationController

  require 'net/https'
  require 'uri'
  require 'google/api_client'

  YOUTUBE_BASE_URL = 'https://www.youtube.com/watch?v='
  DEVELOPER_KEY = ENV['GOOGLE_DEVELOPER_KEY_MYKARAOKE']
  YOUTUBE_API_SERVICE_NAME = 'youtube'
  YOUTUBE_API_VERSION = 'v3'

  def index
    @songs = Category.find(params[:category_id]).songs.includes(:scores)

    @songs.each do |song|
      song.like = song.scores.where(category_id: params[:category_id]).count
    end

    render json: get_song_json(@songs)
  end

  def show
    song = Song.find(params[:id])
    get_video(song)

    render json: @video
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

  def get_song_json(songs)
    json = JSON.parse(songs.to_json(methods: [:like, :artist]))
    json.sort_by! { |hash| -hash['like'].to_i }
    json.first(10)
    json
  end

  def song_params
    params.permit(:title, :artist)
  end

  def get_service
    client = Google::APIClient.new(
      :key => DEVELOPER_KEY,
      :authorization => nil,
      :application_name => 'MyKaraoke',
      :application_version => '1.0.0'
    )
    youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)

    return client, youtube
  end

  def get_video(song)
    client, youtube = get_service

    begin
      search_response = client.execute!(
        :api_method => youtube.search.list,
        :parameters => {
          :part => 'snippet',
          :order => 'relevance',
          :q => song.title + song.artist.name,
          :maxResults => 1,
          :type => 'video',
        }
      )

      @video = {}

      search_response.data.items.each do |search_result|
        p @video = {title: search_result.snippet.title, url:YOUTUBE_BASE_URL+search_result.id.videoId}
      end

    rescue Google::APIClient::TransmissionError => e
      puts e.result.body
    end

    return @video
  end

end