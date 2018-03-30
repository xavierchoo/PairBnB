class UsersController < Clearance::SessionsController

	def home 
	end 

	def show
	end

	def create
	    @user = user_from_params

	    if @user.save
	      sign_in @user
	      redirect_to user_path(@user)
	    else
	      render template: "users/new"
	    end
	end
end
