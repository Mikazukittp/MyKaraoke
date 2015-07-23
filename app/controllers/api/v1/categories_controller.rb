class Api::V1::CategoriesController < ApplicationController

  def index
    @user_type = UserType.find_by(generation_id: params[:generation_id], gender_id: params[:gender_id])
    @categories = @user_type.categories
    render json: @categories
  end

  def show
    @category = Category.find(params[:id])
    render json: @category
  end

  def create
    user_types_ids = UserType.where(generation_id: params[:generation_ids], gender_id: params[:gender_id]).pluck(:id)

    @category = Category.new(category_params)
    @category.song_ids = params[:song_ids]
    @category.user_type_ids = user_types_ids
    @category.save!
    render json: @category
  end

  #適当に作っています
  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    render json: @category
  end

  #適当に作っています
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    render json: {message: '削除が完了しました'}, status: :ok
  end

  private

  def category_params
    params.permit(:name, :description)
  end

end