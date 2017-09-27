class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
   
  end

  def new
    @tweet = Tweet.new
  end

  def create
    tweet_params = params[:tweet].permit(:body)
    tweet = Tweet.new(tweet_params)
    tweet.user_id = current_user.id
    tweet.save
    redirect_to tweetslist_path
  end

  def show
    @tweet = Tweet.find_by(id: params[:id])
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end
	
end

