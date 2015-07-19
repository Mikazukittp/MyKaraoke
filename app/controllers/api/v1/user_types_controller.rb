class Api::V1::UserTypesController < ApplicationController
    #一覧 > GET
  def index
    @user_type = UserType.all()
    #ホントはソートしたい

    render json: @user_type
  end

  #usertypeを指定してuser_typeを出す > GET
  def show
  end

  #新規作成 > POST
  def create
    @user_type = UserType.create(user_type_params)

    render json: @user_type
  end

  #ID指定して編集する > PUT
  def update
  end

  #ID指定して消去 > DELETE
  def destroy
  end

  private

  def user_type_params
    params.require(:user_type).permit(:generation_id, :gender_id)
  end

end