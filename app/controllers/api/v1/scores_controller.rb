class Api::V1::ScoresController < ApplicationController

  def index
    @scores = Score.all
    render json: @scores
  end

  def show
    @score = Score.find(params[:id])
    render json: @score
  end

  def create
    @score = Score.create(song_params)
    render json: @score
  end

  def update
    @score = Score.find(params[:id])
    @score.update(song_params)
    render json: @score
  end

  def destroy
    Score.find(params[:id]).destroy!
    render json: {message: '削除が完了しました'}, status: :ok
  end

  private

  def song_params
    params.require(:score).permit(:category_id, :song_id, :user_id)
  end

end