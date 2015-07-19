class Api::V1::CategoriesController < ApplicationController
  #一覧 > GET
  #
  def index
    personal = {'name' => 'hoge', 'old' => 28}
    render :json => personal
  end

  #ID指定して単体のCategoryを出す > GET
  def show
  end

  #新規作成 > POST
  def create
    @category = Category.create(category_params)
    #ここには、将来的にUser

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
