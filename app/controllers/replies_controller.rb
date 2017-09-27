class RepliesController < ApplicationController

  def new
    @tweet = Tweet.find(params[:tweet_id])
    user = Tweet.find(params[:tweet_id]).user_id
    usernamee = User.find(user).email 
    @username, *rest = usernamee.split(/@/) 

    @reply = @tweet.replies.new

    # function for like by whoever using tooltip 
    like = Like.where(tweet_id:@tweet.id)
    if like.count == 0
      @usernn = 'Like!'
    else
      @usernn = 'Liked by '
      like.each do |likeuser|
        username = User.find(likeuser.user_id).email
        usern, *rest = username.split(/@/)
        if @usernn == 'Liked by '
          @usernn += usern
        else
          @usernn += ', ' + usern
        end
      end
    end
    # end of like by whoever function 

    @noti = Notification.where(tweet: @user)

    # For all replies show
    @allreplies = @tweet.replies.all
    # end of all reply show
    
  end

  def create
    reply_params = params[:reply].permit(:body)
    tweet = Tweet.find(params[:tweet_id])
    @reply = tweet.replies.new(reply_params)
    @reply.user_id = current_user.id
    @reply.save

    word = @reply.body.split(/\W+/)
    words = word[0] 

    userreply = @reply.user_id
    username, *rest = User.find(userreply).email.split(/@/)
    user = current_user

    message = username + ' replied to your tweet, ' + words + '...'
    tweetuser = Tweet.find(params[:tweet_id]).user_id
    notify = user.notifications.create(notify: message, tweet: tweetuser )

    redirect_back(fallback_location: root_path)
    # # respond_to do |f|
    # #   f.html { new_tweet_reply_path(tweet_id: tweet.id) }
    # #   f.js {render :new}
    # end

  end

  def destroy
    reply = Reply.find_by(tweet_id: params[:tweet_id], id: params[:id])
    reply.destroy
    redirect_back(fallback_location: root_path)

  end
	
end