class Api::V1::CategoriesController < ApplicationController
  #一覧 > GET
  def index
    @category = UserType.find(params[:user_type_id]).categories

    render json: @category
  end

  #usertypeを指定してCategoryを出す > GET
  def show
  end

  #新規作成 > POST
  def create
    @category = Category.create(category_params)

    render json: @category
  end

  #ID指定して編集する > PUT
  def update
  end

  #ID指定して消去 > DELETE
  def destroy
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

end
