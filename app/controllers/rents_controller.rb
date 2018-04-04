class RentsController < ApplicationController
def new
  @new_rent = Listing.new
end

def create 
    
    	@rent = Listing.new(listing_params)
    	if @rent.save
    		redirect_to "/checkboxes"
  	 	end
    
end

private

  def listing_params
  	params.require(:listing).permit(:location, :style, :room)
  end

end
