class LikesController < ApplicationController

  def create
    tweet = Tweet.find(params[:tweet_id])
    like = tweet.likes.create(tweet_id: params[:tweet_id])
    like.user_id = current_user.id
    like.save
    redirect_back(fallback_location: root_path)

  end

  def destroy
    like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    
    # byebug
    like.destroy
    redirect_back(fallback_location: root_path)
  end
	
end