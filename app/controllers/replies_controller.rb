class RepliesController < ApplicationController

  def create
    reply_params = params[:reply].permit(:body)
    tweet = Tweet.find(params[:tweet_id])
    @reply = tweet.replies.new(reply_params)
    @reply.user_id = current_user.id
    @reply.save
    redirect_to root_path

  end
	
end