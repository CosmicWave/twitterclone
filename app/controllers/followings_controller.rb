class FollowingsController < ApplicationController
  # before_action :logged_in_user

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to root_path
  end

  def destroy
    user = Following.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to root_path
  end
end