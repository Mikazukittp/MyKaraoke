class Api::V1::CategoriesController < ApplicationController
  def index
    personal = {'name' => 'hoge', 'old' => 28}
    render :json => personal
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def song_params
  end

end
