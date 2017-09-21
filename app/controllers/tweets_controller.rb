class TweetsController < ApplicationController

	def index
		@tweets = Tweet.all
		@reply = Reply.all
	end


	def new
		@tweet = Tweet.new

	end

	def create 

		tweet_params = params[:tweet].permit(:body)
		@tweet = Tweet.new(tweet_params)
		if @tweet.save
			flash[:success] = "Tweet created successfully"
			redirect_to tweets_path
		
		end
	end


	def edit
		@tweet = Tweet.find_by(id: params[:id])
	end


	def update
		tweet_params = params[:tweet].permit(:body)
		@tweet = Tweet.find_by(id: params[:id])
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

