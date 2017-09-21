class PagesController < ApplicationController

  def index

    if user_signed_in?
      redirect_to tweets_path
    end

  end

  def tweets

    if !user_signed_in?
      redirect_to root_path
    end

    username = current_user.email
    @username, *rest = username.split(/@/)

  end
  
  
end