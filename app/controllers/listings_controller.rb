class ListingsController < ApplicationController
    before_action :authenticate_user!

    def index

        @listings = Listing.all
    end 

    def new 
       @categories = Category.all
        @listing = Listing.new
    end 


    def create
        current_user.listings.create(listing_params)
       
    end


end 


private



def listing_params
    params.require(:listing).permit(:title, :description,:price)
end 