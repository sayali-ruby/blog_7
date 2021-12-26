class Api::V1::CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json:  Category.all.map{|category| {id: category.id,name:category.name}}
  end

    def update
      @category = Category.find(params[:id])
      # binding.pry
      if @category.update(category_params)
        # if category is updates successfully
        render json: Category.all.map{|category| {id: category.id, name:category.name}}
      else
        # Show message that category some error while update
        render json: { message: @category.errors.full_messages }, status: :unprocessable_entity
      end
    end

      # Only allow a list of trusted parameters through.
      # Whitelisting of params
      def category_params
        params.require(:category).permit(:name)
      end
end
