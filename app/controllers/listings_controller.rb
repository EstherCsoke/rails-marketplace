class ListingsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :edit, :new, :conversations, :show]
	before_action :set_categories, only: [:new,:create, :edit]

  #shows the categories
  def index
    @listings = params[:category_id]
    sort_listings_by_new
    # @listings = Listing.where(in_stock: true)
    @listings = Listing.paginate(page: params[:page], per_page: 6)
  end 
  

  def home
    sort_listings_by_new
    @listings = Listing.where(in_stock: true)
  end 
  
  #deletes listings
	def destroy
    Listing.find(params[:id]).destroy
    redirect_to root_path
	end
  
  #initaies creartion of listings
	def new 
		@listing = Listing.new
	end 

  #shows listings and geenrates stripe session
  def show
    @listing = Listing.find(params[:id]) 
    generate_stripe_session
  end 

  #creates the listing
  def create
		@listing = current_user.listings.create(listing_params)
		# @listing.category_id = params[:category_id]
    if @listing.save
      success_message
      redirect_to @listing
    else 
      # render 'new'
      flash[:alert] = "Opps! Something Went Wrong! The listing was not created!"
    end
  end

  # edits the listing
  def edit
		# @categories = Category.all.map { |c| [c.kind, c.id]  }
		find_user_listing
    # render("edit")
	end 
  
  #updates listing
  def update
    find_user_listing
    if @listing.update(listing_params)
      success_message
      redirect_to listing_path
    else
      render 'edit'
      flash[:error] = "Todo was NOT saved"
    end
  end


end

#calls parameter
private
def listing_params
  params.require(:listing).permit(:title, :description,:price, :picture, :category_id, :in_stock)
end 
#finds listing per id
def find_user_listing
  @listing = current_user.listings.find_by_id(params[:id])

end
#sets categories
def set_categories
	@categories = Category.all
end

def sort_listings_by_new
  @listings = Listing.all.sort_by(&:created_at)
end 

#succuess message
def success_message
  flash[:success] = "Successful!"
end 
#shows stripe
def generate_stripe_session
  session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
          name: current_user.id,
          currency: 'aud',
          quantity: 1,
          amount: @listing.price*100
          
       
      }],
      payment_intent_data: {
          metadata: {
              user_id: current_user.id, listing_id: @listing.id,
              in_stock: @listing.in_stock = false
          }
      },
  
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
      cancel_url: "#{root_url}listings"
  )

  
 
  @session_id = session.id
  
end

