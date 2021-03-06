class PagesController < ApplicationController

  def index

    if user_signed_in?
      redirect_to tweetslist_path
    end

  end

  def tweets

    # Check if any user signed in
    if !user_signed_in?
      redirect_to root_path

    else
      
      # Profile pic initialise
      username = current_user.email
      @username, *rest = username.split(/@/)

      # Tweet initialise
      @tweet = Tweet.new

      # Tweets initialise
      @user = current_user.id
      @usertweets = Tweet.where(user_id:@user).order(:created_at).reverse
      @userstweets = Tweet.all.order(:created_at).reverse

      # user tweets count
      user = current_user.id
      @tweets = Tweet.where(user_id:user)

      @userfollow = current_user

      @alluser = User.all

      @noti = Notification.where(tweet: @user)
      
    end

  end


  def profile
    @name = current_user.name
    @email = current_user.email
  end

  
end