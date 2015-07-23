class Api::V1::ScoresController < ApplicationController
  before_action :get_user

  def index
    @scores = Score.where(user_id: @user.id)
    render json: @scores
  end

  def show
    @score = Score.find(params[:id])
    render json: @score
  end

  def create
    @score = Score.create(score_params)

    return render json: { message: 'すでに「歌いたい」しています' }, status: 500 if utaitai?

    @score.user_id = @user.id
    @score.save!

    render json: @score
  end

  def update
    @score = Score.find(params[:id])
    @score.update(score_params)
    render json: @score
  end

  def destroy
    Score.find(params[:id]).destroy!
    render json: { message: '削除が完了しました' }, status: :ok
  end

  def check
    render json: utaitai?
  end

  private

  def score_params
    params.permit(:category_id, :song_id)
  end

  def utaitai?
    Score.exists?(category_id: params[:category_id], song_id: params[:song_id], user_id: @user.id)
  end

  def get_user
    @user = User.find_by(token: request.headers[:Token])
  end

end