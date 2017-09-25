class TweetsController < ApplicationController


	def js_test
		@like = Like.find_by(tweet_id: 'index')
		if @like == nil
			@like = Like.create(tweet_: 'index', count: 1)
		else
			@like.count +=1
			@like.save
		end
	end


	def index
		@tweets = Tweet.all
		@replies = Reply.all
	end


	def new
		@tweet = Tweet.new

	end

	def create 
		tweet_params = params[:tweet].permit(:body, :image)
		@tweet = Tweet.new(tweet_params)
		@tweet.user = current_user
		
		if @tweet.save
			flash[:success] = "Tweet created successfully"
			redirect_to tweets_path
		
		end
	end


	def edit
		@tweet = Tweet.find_by(id: params[:id])
	end


	def update
		tweet_params = params[:tweet].permit(:body, :image)
		@tweet = Tweet.find_by(id: params[:id])
		@tweet.user = current_user
		if @tweet.update(tweet_params)
			flash[:success] = "Tweet updated successfully"
			redirect_to tweets_path
		end
	
	end


	def show
		@tweet = Tweet.find_by(id: params[:id])
		@reply = Reply.new
	
	end



	def destroy
		@tweet = Tweet.find_by(id: params[:id])
		@tweet.destroy
		redirect_to tweets_path
	end





end

