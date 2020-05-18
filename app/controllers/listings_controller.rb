class ListingsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :edit, :new]
	before_action :set_categories, only: [:new,:create, :edit]
	

  def index
    @listings = Listing.all.sort_by(&:created_at).reverse
    @listing = params[:category_id]
		@listings = Listing.paginate(page: params[:page], per_page: 5)
  end 
  
  def home
    @listings = Listing.all.sort_by(&:created_at).reverse
    @listings = Listing.paginate(page: params[:page], per_page: 5)
  end 
	
	def destroy
    Listing.find(params[:id]).destroy
    redirect_to root_path
	end
	
	def new 
		@listing = Listing.new
	end 

  def show
    @listing = Listing.find(params[:id])
  end 

  def create
		@listing = current_user.listings.create(listing_params)
		@listing.category_id = params[:category_id]
		if @listing.save
    	flash[:notice] = "Todo was created successfully"
			redirect_to @listings
    else 
      render 'new'
    end
  end
  
  def edit
		@categories = Category.all.map { |c| [c.kind, c.id]  }
		@listing = current_user.listings.find_by_id(params[:id])
    render("edit")
	end 
  
  def update
    @listing = current_user.listings.find_by_id(params[:id])
    if @listing
      @listing.update(listing_params)
      if @listing.errors.any?
        render "edit"
    else
      redirect_back(fallback_location: root_path) 
      end
      else
      redirect_back(fallback_location: root_path) 
      end
  end
    
  end 

private
def listing_params
  params.require(:listing).permit(:title, :description,:price, :picture, :category_id)
end 

def set_categories
	@categories = Category.all
end

