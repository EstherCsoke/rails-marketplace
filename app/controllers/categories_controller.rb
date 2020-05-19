eaiclass CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end
    
    def create
      @category = Category.new(category_params)
      if @category.save
        flash[:notice] = "Todo was created successfully"
        render "new"
      else 
        render 'new'
      end
    end 
end 
   
private
# Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

# Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:kind)
  end


