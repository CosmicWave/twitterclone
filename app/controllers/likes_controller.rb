class LikesController < ApplicationController

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @like = @tweet.likes.create(user: current_user)
    @like.tweet_id = @tweet.id
    @like.save
    redirect_to root_path

  end

  def destroy
    like = Like.find_by(user_id:params[:id])
    
    # byebug
    like.destroy
    redirect_to root_path
  end
	
end