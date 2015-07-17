class Api::V1::SongsController < ApplicationController

  def index
    @songs = Category.find(params[:category_id]).songs
    render json: @songs
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

end