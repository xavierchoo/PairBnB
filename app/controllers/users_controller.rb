class UsersController < Clearance::SessionsController

	def home 
	end 

	def show
		redirect_to "/checkboxes"
	end

	def create
	    @user = user_from_params

	    if @user.save
	      sign_in @user
	      redirect_to getcheck_path(@user)
	    else
	      render template: "users/new"
	    end
	end
end
