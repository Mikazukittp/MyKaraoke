class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by(token: request.headers[:Token])

    render json: get_user_type(@user)
  end

  def create
    @user = User.new(user_params)
    user_type = UserType.find_by(generation_id: params[:generation_id], gender_id: params[:gender_id])

    if user_type
      @user.user_type_id = user_type.id
    else
      return render json: {message: 'そんなユーザータイプはありません'}, status: 500
    end

    @user.new_token
    @user.save!

    render json: get_user_type(@user)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: get_user_type(@user)
  end

  def destroy
    @user = User.find_by(token: request.headers[:Token])
    @user.destroy!

    render json: {message: '削除が完了しました'}, status: :ok
  end

  private

  def user_params
    params.permit(:name)
  end

  def get_user_type(user)
    json = JSON.parse(user.to_json)
    json[:user_type] = user.user_type
    json
  end

end