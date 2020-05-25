class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  # Displays all of the category options
  def index
      @categories = Category.all
  end

  # Initiates a new category
  def new
    @category = Category.new
  end
    
  # Used to create the categories options 
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was created successfully"
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


