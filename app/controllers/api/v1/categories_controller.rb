class Api::V1::CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json:  Category.all.map{|category| {id: category.id,name:category.name, phone: category.phone}}
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render json: Category.all.map{|category| {id: category.id, name:category.name, phone: category.phone }}
    else
      render json: { message: @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @category = Category.find_by(id: params[:id])
    if @category
      render json: @category
    else
      render json: { message: "category not found" }
    end
  end

  def update
    @category = Category.find_by(id: params[:id])
    # binding.pry
    if @category
      if @category.update(category_params)
        # if category is updates successfully
        render json: Category.all.map{|category| {id: category.id, name:category.name, phone: category.phone}}
      else
        # Show message that category some error while update
        render json: { message: @category.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: "category not found" }
    end
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    if @category
      @category.destroy
      render json: Category.all.map{|category| {id: category.id, name:category.name}}
    else
      render json: { message: "category not found" }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    # Whitelisting of params
    def category_params
      params.require(:category).permit(:name, :phone)
    end
end
