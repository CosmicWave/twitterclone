class LikesController < ApplicationController

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @like = @tweet.likes.create(tweet_id: params[:tweet_id])
    @like.user_id = current_user.id
    @like.save

    user = current_user
    username, *rest = user.email.split(/@/)

    word = @tweet.body.split(/\W+/)
    words = word[0] 
    message = 'Your tweet, ' + words + '..., is liked by ' + username + '!'
    tweetuser = Tweet.find(params[:tweet_id]).user_id
    notify = user.notifications.create(notify: message, tweet: tweetuser )

#   redirect_back(fallback_location: root_path)
    
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    @like.destroy

#  redirect_back(fallback_location: root_path)
  end
	
end