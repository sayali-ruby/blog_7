class Api::V2::CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @category = Category.find_by(id: params[:id])
    if @category
      render json: { id: @category.id, name: @category.name, phone: @category.phone }
    else
      render json: { message: "category not found" }
    end
  end
end
