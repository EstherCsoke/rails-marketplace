class ListingsController < ApplicationController
    before_action :authenticate_user!

    def index

        @listings = Listing.all
    end 

    def destroy
        Listing.find(params[:id]).destroy
        redirect_to root_path
    end

    def new 
    #    @categories = Category.all
        @listing = Listing.new
       
    end 

    def show
        @listing = Listing.find(params[:id])
    end 

  





    def create
       @listing = current_user.listings.create(listing_params)
        if @listing.save
        flash[:notice] = "Todo was created successfully"
        render 'new'
    
    end
end


   

 

    def edit
        @categories = Category.all

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
    params.require(:listing).permit(:title, :description,:price, :picture)
end 