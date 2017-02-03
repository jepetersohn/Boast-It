class CategoriesController < ApplicationController
  def create
  end

  def show
    @user = User.find(params[:user_id])
    @category = Category.find(params[:id])
    @boasts = Boast.where(user_id: @user.id, category_id: @category.id)
  end
end
