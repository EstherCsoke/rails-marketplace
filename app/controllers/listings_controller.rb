class ListingsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :edit, :new, :conversations]
	before_action :set_categories, only: [:new,:create, :edit]

  def index
    @listings = params[:category_id]
    sort_listings_by_new
    @listings = Listing.where(in_stock: true)
    @listings = Listing.paginate(page: params[:page], per_page: 6)
  end 
  
  def home
    sort_listings_by_new
    @listings = Listing.where(in_stock: true)
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
    generate_stripe_session
  end 

  def create
		@listing = current_user.listings.create(listing_params)
		# @listing.category_id = params[:category_id]
    if @listing.save
      flash[:success] = "Your Listing was Created"
      redirect_to @listing
    else 
      # render 'new'
      flash[:alert] = "Opps! Something Went Wrong! The listing was not created!"
    end
  end

  def edit
		# @categories = Category.all.map { |c| [c.kind, c.id]  }
		find_user_listing
    # render("edit")
	end 
  
  def update
    find_user_listing
    if @listing.update(listing_params)
      flash[:success] = "This Listing was Edited"
      redirect_to listing_path
    else
      render 'edit'
      flash[:error] = "Todo was NOT saved"
    end
  end

end


private
def listing_params
  params.require(:listing).permit(:title, :description,:price, :picture, :category_id, :in_stock)
end 

def find_user_listing
  @listing = current_user.listings.find_by_id(params[:id])

end

def set_categories
	@categories = Category.all
end

def sort_listings_by_new
  @listings = Listing.all.sort_by(&:created_at).reverse
end 

def generate_stripe_session
  session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
          name: current_user.id,
          currency: 'aud',
          quantity: 1,
          amount: @listing.price
       
      }],
      payment_intent_data: {
          metadata: {
              user_id: current_user.id, listing_id: @listing.id, in_stock: @listing.in_stock
          }
      },
  
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
      cancel_url: "#{root_url}listings"
  )

 
  @session_id = session.id
  
end

