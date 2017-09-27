class UsersController < ApplicationController

	def create
    	user_params = params[:user].permit(:image)
    	user = User.new(user_params)
    	user.user_id = current_user.id
    	user.save
    	redirect_to edit_user_registration_path
 	end
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

end
