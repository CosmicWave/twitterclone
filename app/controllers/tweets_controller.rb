class TweetsController < ApplicationController

  def create
    tweet_params = params[:tweet].permit(:body)
    tweet = Tweet.new(tweet_params)
    tweet.user_id = current_user.id
    tweet.save
    redirect_to tweetslist_path
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end
	
end