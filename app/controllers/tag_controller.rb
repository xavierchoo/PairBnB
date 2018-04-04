class TagController < ApplicationController

  def new
  	@new_tag = Tag.new
  end

  def index
  	@tags = Tag.all.order("created_at DESC")
  end

  def create
    if !tag_params.empty?
    	@tag = Tag.new(tag_params)
    	if @tag.save
    		redirect_to "/tag/show/#{@tag.id}"
      
    	else
    		render 'new'
  	 end
    end
  end

  def show 
  	@tag = Tag.find(params[:id])
  end

  def checkbox
    if(params.has_key?(:tag) )
     @products = Listing.where(location: params[:tag][:location]) 
    end   
    @lists = Listing.all
  end

private

  def tag_params
  	params.require(:tag).permit(:location, :style, :room)
  end


end
