class UsersController < ApplicationController

	def create
    	user_params = params[:user].permit(:image)
    	user = User.new(user_params)
    	user.user_id = current_user.id
    	user.save
    	redirect_to edit_user_registration_path
 	end


	

 end