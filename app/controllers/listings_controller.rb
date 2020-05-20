class ListingsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :edit, :new]
	before_action :set_categories, only: [:new,:create, :edit]
	

  def index
    @listings = params[:category_id]
    @listings = Listing.all.sort_by(&:created_at).reverse
    @listings = Listing.where(in_stock: true)
    # @listings = Listing.paginate(page: params[:page], per_page: 5)
  end 
  
  def home
    @listings = Listing.all.sort_by(&:created_at).reverse
    @listings = Listing.where(in_stock: true)
    # @listings = Listing.paginate(page: params[:page], per_page: 5)
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
		@listing.category_id = params[:category_id]
    if @listing.save
      flash[:notice] = "Listing was created successfully"
      redirect_to root_path  
    else 
      render 'new'
      # flash[:notice] = "Opps! The listing was not created!"
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
  params.require(:listing).permit(:title, :description,:price, :picture, :category_id, :in_stock)
end 

def set_categories
	@categories = Category.all
end

def generate_stripe_session
  session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
          name: "Coder Academy",
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
      cancel_url: "#{root_url}"
  )

  # @listing.in_stock = false
  # @listing.save
  @session_id = session.id
  
end

