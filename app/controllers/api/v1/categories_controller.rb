class Api::V1::CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json:  Category.all.map{|category| {id: category.id,name:category.name}}
  end

    def update
      @category = Category.find(params[:id])
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to category_url(@category), notice: "category was successfully updated." }
          format.json { render :show, status: :ok, location: @category }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

      # Only allow a list of trusted parameters through.
      def category_params
        params.require(:category).permit(:name)
      end
end